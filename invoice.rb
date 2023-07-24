class Invoice

  attr_reader :date, :product, :cost
  def initialize(date, product, cost)
    @date = date
    @product = product
    @cost = cost
  end
end

skateboard_invoice = Invoice.new(Time.now, 'skateboard', 23.99)

p skateboard_invoice.cost
