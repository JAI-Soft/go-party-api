class User < ApplicationRecord
  rolify roles: [:user, :organizer]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :surname, presence: true
  validates :birthday, presence: true
  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:user)
  end

  def generate_jwt
    JWT.encode({id: id, exp: 60.days.from_now.to_i}, Rails.application.secrets.secret_key_base)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["birthday", "created_at", "email", "encrypted_password", "id", "name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "surname", "updated_at", "username"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["roles"]
  end
end
