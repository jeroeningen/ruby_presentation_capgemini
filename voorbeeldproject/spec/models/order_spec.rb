require 'rails_helper'

describe Order do
  it { should validate_presence_of :name }
  it { should have_many :orderlines }

  context ".total" do
    let(:order) do
      Order.new(
        name: "My first order", 
        orderlines_attributes: [
          {product_name: "Bed", price: 300, quantity: 1}, 
          {product_name: "Deken", price: 100, quantity: 2}
        ]
      )
    end
    it "calculates the totals of an orderline" do
      expect(order.total).to eq(500)
    end
  end
end
