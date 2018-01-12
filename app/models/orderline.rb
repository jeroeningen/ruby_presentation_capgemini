class Orderline < ApplicationRecord
  validates :product_name, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
  belongs_to :order
end
