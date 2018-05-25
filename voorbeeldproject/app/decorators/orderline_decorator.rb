class OrderlineDecorator < BaseDecorator
  def price
    "EUR. #{@model.price},00"
  end

  def quantity
    "#{@model.quantity} stuks"
  end
end
