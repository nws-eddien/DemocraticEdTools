class MediaSession < ApplicationRecord
    belongs_to :media_time, dependent: :destroy, touch: true
    validates :active, uniqueness: {scope: :media_time}, if: :is_active
    validate :not_to_many_active_sessions, on: :create
    before_create :set_start_time
    after_touch :broadcast_to_circular_progress


    after_save_commit -> {
        broadcast_replace_to "circular_progress_#{self.media_time.id}", partial: "media_time/logins/circular_progress", locals: { media_time: self.media_time }, target: "circular_progress_#{self.media_time.id}"
        broadcast_replace_to "login_display", partial: "media_time/logins/logins_circular", target: "login_display"
    }

    def set_start_time
        self.started_at = Time.now
    end
    def not_to_many_active_sessions
        if (MediaSession.where(:active => true).count >= MediaGlobalSetting.first.max_active_users) && MediaGlobalSetting.first.max_active_users != 0
            errors.add(:active_users, "Zu viele Leude eingeloggt!")
        end
    end

    def is_active
        self.active?
    end

    def duration
        if self.final_duration == nil then
            (Time.now - self.started_at).to_i
        else self.final_duration end
    end

    def self.toggle(media_time)
        active_session = media_time.media_sessions.where(:active => true).first
        if active_session == nil 
            media_time.media_sessions.create
            media_time.broadcast_to_EventsChannel("green", "Eingeloggt", "#{media_time.user.name} hat sich gerade eingeloggt")
        else
            active_session.finish
            media_time.broadcast_to_EventsChannel("yellow", "Ausgeloggt", "#{media_time.user.name} hat sich gerade ausgeloggt")
        end
    end

    def finish
            self.update({:ended_at => Time.now, :active => false, :final_duration => (Time.now - self.started_at)}) if active
    end
    
    
end
