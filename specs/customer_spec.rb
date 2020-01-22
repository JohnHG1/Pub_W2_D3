require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new
require_relative("../drink")
require_relative("../pub")

class TestCustomer < MiniTest::Test

  def setup
    @customer1 = Customer.new("Luke", 100)
    @customer2 = Customer.new("John", 20)
  end


end
