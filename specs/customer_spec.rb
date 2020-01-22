require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new
require_relative("../drink")
require_relative("../pub")
require_relative("../customer")


class TestCustomer < MiniTest::Test

  def setup
    @customer1 = Customer.new("Luke", 100, 28)
    @customer2 = Customer.new("John", 20, 29)
    @Pub1 = Pub.new("4043", 1000)
    @drink1 = Drink.new("Rum", 5)
    @drink2 = Drink.new("Beer", 2)
  end

  def test_remove_money_from_wallet()
    @customer1.remove_money_from_wallet(@drink2.price)
    assert_equal(98, @customer1.wallet)
  end

  def test_can_buy_drink()
    @customer2.buy_drink(@drink1.price, @Pub1)
    assert_equal(15, @customer2.wallet)
    assert_equal(1005, @Pub1.till)

  end


end
