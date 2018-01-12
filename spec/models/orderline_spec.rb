describe Orderline, type: :model do
  it { should validate_presence_of :product_name }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  it { should belong_to :order }
end
