class MediaTime < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :media_sessions
  has_many :media_time_corrections
  has_many :media_bans
  has_many :media_penalties
  after_touch :broadcast_to_MediaTimeChannel
  before_save :check_time_limit

  def broadcast_to_MediaTimeChannel
    ActionCable.server.broadcast(
      "media_time_update",
      self.as_json_with_user
    )
  end

  def broadcast_to_EventsChannel(color = "yellow", title, message)
    ActionCable.server.broadcast(
      "login_messages",
      { :snackbar => { :active => true, :color => color, :title => title, :text => message } }
    )
  end

  def media_settings
    return MediaGlobalSetting.first
  end

  def exceeded?
    if time_left + exceedable_time < 0
      if self.active
        media_bans.create
        self.log_out
      end
      # banned message
      if media_settings.behavior_on_exceed == "penalty"
        # penalty
      end
      return true
    else
      return false
    end
  end

  def log_out
    self.media_sessions.find_by_active(true).finish
  end

  def active
    self.media_sessions.find_by_active(true).present?
  end

  def time_used_today
    sessions = media_sessions.where(started_at: Date.today.all_day)
    time_used = sessions.sum(&:duration)
    return time_used
  end

  def status
    if active
      return "logged_in"
    elsif is_banned?
      return "banned"
    elsif low_on_time?
      "low_on_time"
    elsif out_of_time?
      "out_of_time"
    else
      "ok"
    end
  end

  def is_banned?
    media_bans.active.count > 0
  end

  def low_on_time?
    time_left < 60 && time_left > 0
  end

  def out_of_time?
    time_left <= 0
  end

  def toggle_media_session
    self.media_bans.where(ended: false).each(&:checkout_ban)
    if !self.exceeded?
      if self.media_bans.active.count > 0
        self.media_bans.active.each(&:add_login_attempt)
        self.media_sessions.find_by_active(true).finish if self.active
        MediaBan.checkout_bans(self.media_bans.active)
        self.broadcast_to_EventsChannel("red", "BANNED", "#{self.user.name} ist heute gesperrt")
        return false
      else
        MediaSession.toggle(self)
      end
    else
      self.broadcast_to_EventsChannel("red", "Heute nichtmehr...", "#{self.user.name} hat seine Zeit heute Überzogen")
    end
  end

  def self.toggle_by_pin(pin)
    media_time = User.find_by_pin(pin).media_time
    if media_time != nil
      media_time.toggle_media_session
      return media_time
    end
  end

  def time_left
    todays_time_limit - time_used_today + todays_correction
  end

  def todays_correction
    media_time_corrections.where(created_at: Date.today.all_day).sum(:correction_amount) * 60
  end

  def exceedable_time
    if media_settings.behavior_on_exceed == "ban"
      return 0
    else
      return todays_time_limit / media_settings.penalty_factor
    end
  end

  def todays_time_limit
    if time_limit == 0 || time_limit > MediaGlobalSetting.first.daily_time_limit then
      return MediaGlobalSetting.first.daily_time_limit * 60
    else
      return time_limit * 60
    end
  end

  def check_time_limit
    if self.time_limit == MediaGlobalSetting.first.daily_time_limit
      self.time_limit = 0
    end
  end

  scope :active_media_times, -> { joins(:media_sessions).where(media_sessions: { active: true }) }
  scope :as_json_with_user, -> { as_json(:include => [:user], :methods => [:time_left, :todays_time_limit, :exceedable_time, :active]) }

  def as_json_with_user
    as_json(:include => [:user], :methods => [:time_left, :todays_time_limit, :exceedable_time, :active])
  end
end
