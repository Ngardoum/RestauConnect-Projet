class Menu < ApplicationRecord
  class Menu < ApplicationRecord
    # Associations
    belongs_to :restaurant
    has_many :order_items
  
    # Validations
    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  end
  
end
