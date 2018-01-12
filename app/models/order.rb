class Order < ApplicationRecord

  validates :name, presence: true

  has_many :orderlines
  accepts_nested_attributes_for :orderlines

  def total
    orderlines.collect{ |orderline| orderline.price * orderline.quantity }.sum
  end
end
