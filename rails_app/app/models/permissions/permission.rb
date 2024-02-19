class Permission < ApplicationRecord
  belongs_to :app
  has_many :role_permissions
  has_many :roles, through: :role_permissions

  scope :ordered, -> {order(name: :asc)}

end
