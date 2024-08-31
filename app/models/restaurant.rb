class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :menus
  has_many :orders

  # Validations
  validates :name, presence: true
  validates :address, presence: true
  validates :cuisine, presence: true
end
