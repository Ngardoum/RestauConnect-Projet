class User < ApplicationRecord
  # Associations
  has_one :restaurant
  has_many :orders

  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # User roles
  enum role: { customer: 0, restaurant_owner: 1, admin: 2 }

  # Set default role
  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :customer
  end
end
