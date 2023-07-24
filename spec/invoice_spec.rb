require 'invoice'



RSpec.describe Invoice, "cost" do
  context "after initialization" do
    it "accesses the cost of the invoice" do
      invoice = Invoice.new(Time.now, 'skateboard', 25.99)

    end
  end

end