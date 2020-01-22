require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new
require_relative("../drink")
require_relative("../customer")
require_relative("../pub")


class TestPub < MiniTest::Test

  def setup
    @Pub1 = Pub.new("4043", 1000)
    @customer1 = Customer.new("Luke", 100)
    @customer2 = Customer.new("John", 20)
    @drink1 = Drink.new("Rum", 5)
    @drink2 = Drink.new("Beer", 2)
    @drinks = [@drink1, @drink2]
  end

  def test_can_get_drink_price
    assert_equal(5, @drink1.price)
  end

  def test_can_get_drink_name
    assert_equal("Beer", @drink2.name)
  end

  def test_add_drinks_to_array
    @Pub1.add__drinks(@drinks)
    assert_equal(2, @Pub1.num_of_drinks)
  end




end
