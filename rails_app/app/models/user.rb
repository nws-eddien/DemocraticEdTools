class User < ApplicationRecord
  devise :database_authenticatable, :validatable
  has_one_attached :avatar
  has_one :media_time
  has_and_belongs_to_many :roles
  has_many :memberships
  has_many :membershiplevels, through: :memberships
  has_many :groups, through: :membershiplevels
  before_create :generate_password
  after_create :initialize_user
  validates :name, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP, :allow_blank => true

  def self.create_dummys(number = 1)
    number.times do
      charset = Array("a".."z")
      name = Array.new(8) { charset.sample }.join
      User.create({ :name => name, :email => name + "@no-mail" })
    end
  end

  def initialize_user
    self.create_media_time
    if self.pin.nil? || self.pin.empty? then
      self.pin = generate_pin
    end
    save
  end

  def generate_password
    if self.password == nil
      charset = Array("0".."9") + Array("a".."z")
      self.password = Array.new(5) { charset.sample }.join
    end
  end

  def generate_pin
    digits = pin_length
    doubles = 0
    if easy_pin
      doubles = digits / 2
    end
    loop do
      charset = Array("0".."9")
      pin_array = []
      doubles.times do |d|
        sample = charset.sample
        pin_array << [sample, sample].join
      end
      (digits - 2 * doubles).times do |d|
        pin_array << charset.sample
      end

      pin = pin_array.shuffle().join
      break pin unless User.where(:pin => pin).exists?
    end
  end

  def request_password_reset
    self.set_reset_password_token
    UserMailer.with(id: self.id).reset_password_mail.deliver_now
  end

  def all_roles
    (self.roles + self.memberships.collect { |membership| membership.roles }).flatten.uniq
  end

  def permissions
    Rails.cache.fetch("user_#{self.id}_permissions", :expires_in => 5.minutes) do
      all_roles.collect { |role| role.permissions }.flatten.uniq
    end
  end

  def with_main_attributes
    self.as_json(:methods => [:permissions])
  end

  def is_allowed_to?(permission_name)
    permissions.collect {|permission| permission.name}.include? (permission_name)
  end
  def email_required?
    false
  end

end
