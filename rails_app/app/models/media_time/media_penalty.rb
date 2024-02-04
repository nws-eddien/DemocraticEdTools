class MediaPenalty < ApplicationRecord
    belongs_to :media_time, dependent: :destroy

end
