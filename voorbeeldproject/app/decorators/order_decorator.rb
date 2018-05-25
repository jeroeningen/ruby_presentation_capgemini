class OrderDecorator < BaseDecorator
  def id
    "\##{@model.id}"
  end
  def total
    "EUR. #{@model.total},00"
  end
end
