class MediaBan < ApplicationRecord
    belongs_to :media_time, dependent: :destroy
    enum ban_mode: {ban_by_date: 0, ban_by_days_count: 1}
    before_save :before_save_actions
    

    def before_save_actions
      self.login_attempts = self.login_attempts.uniq
      self.ban_start ||= Date.tomorrow
      self.ban_end ||= Date.today + 2.days if self.ban_mode == 0
    end
    
    def self.checkout_bans(bans= MediaBan.where(:ended => false))
      bans.each(&:checkout_ban)
    end

    def add_login_attempt
      self.login_attempts << Date.today
      self.save 
    end

    def checkout_ban
      return if ended
      update(active: true) if  !active && ban_start <= Date.today
      if ban_mode == "ban_by_days_count"
        attempts = login_attempts.select { |a| a < Date.today && a >= ban_start }
        update(ended: true, active: false) if days_count <= attempts.count
      else
        update(ended: true, active: false) if Date.today > ban_end
      end
    end

    scope :active, -> {where(:active => true)}

end
