class Order < ApplicationRecord

  validates :name, presence: true

  has_many :orderlines, dependent: :destroy
  accepts_nested_attributes_for :orderlines, reject_if: :all_blank

  def total
    orderlines.collect{ |orderline| orderline.price * orderline.quantity }.sum
  end
end
