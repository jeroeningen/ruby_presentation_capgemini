describe OrderlineDecorator do
  let(:orderline_decorator) do
    OrderlineDecorator.new(
      Orderline.new(
        price: 100,
        quantity: 2
      )
    )
  end
  context ".price" do
    it "displays the price" do
      expect(orderline_decorator.price).to eq("EUR. 100,00")
    end
  end

  context ".quantity" do
    it "displays the quantity" do
      expect(orderline_decorator.quantity).to eq("2 stuks")
    end
  end
end
