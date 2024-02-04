class MediaGlobalSetting < ApplicationRecord
enum behavior_on_exceed: {
    ban: 0,
    penalty: 1
}

end
