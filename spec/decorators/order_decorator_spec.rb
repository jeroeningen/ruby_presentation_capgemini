describe OrderDecorator do
  let(:order_decorator) do
    OrderDecorator.new(
      Order.new(
        name: "My first order", 
        orderlines_attributes: [
          {product_name: "Bed", price: 300, quantity: 1}, 
          {product_name: "Deken", price: 100, quantity: 2}
        ]
      )
    )
  end
  context ".total" do
    it "displays the price" do
      expect(order_decorator.total).to eq("EUR. 500,00")
    end
  end
end
