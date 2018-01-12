class OrderDecorator < BaseDecorator
  def total
    "EUR. #{@model.total},00"
  end
end
