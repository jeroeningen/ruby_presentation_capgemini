class BaseDecorator < SimpleDelegator
  def initialize model
    @model = model
  end
end
