class Order < ApplicationRecord
  class Order < ApplicationRecord
    # Associations
    belongs_to :user
    belongs_to :restaurant
    has_many :order_items, dependent: :destroy
  
    # Validations
    validates :status, presence: true
    validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
    # Default status
    after_initialize :set_default_status, if: :new_record?
  
    private
  
    def set_default_status
      self.status ||= 'pending'
    end
  end
  
end
