require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new
require_relative("../drink")
require_relative("../customer")
require_relative("../pub")


class TestPub < MiniTest::Test

  def setup
    @Pub1 = Pub.new("4043", 1000)
    @customer1 = Customer.new("Luke", 100, 17)
    @customer2 = Customer.new("John", 20, 29)
    @drink1 = Drink.new("Rum", 5, 2)
    @drink2 = Drink.new("Beer", 2, 1)
    @drink3 = Drink.new("Liver_failure", 20, 30)
    drinks = [@drink1, @drink2, @drink3]
  end

  def test_can_get_drink_price
    assert_equal(5, @drink1.price)
  end

  def test_can_get_drink_name
    assert_equal("Beer", @drink2.name)
  end

  def test_can_get_number_of_drinks
    assert_equal(0, @Pub1.num_of_drinks)
  end

  def test_add_drinks_to_array_add
    @Pub1.add_drinks(@drink1)
    @Pub1.add_drinks(@drink2)
    assert_equal(2, @Pub1.num_of_drinks)
  end

  def test_take_drinks_from_array_remove
    @Pub1.add_drinks(@drink1)
    @Pub1.add_drinks(@drink2)
    @Pub1.take_drinks(@drink1)
    assert_equal(1, @Pub1.num_of_drinks)
  end

  def test_can_get_till_total
    assert_equal(1000, @Pub1.till)
  end

  def test_add_money_to_till
    @Pub1.add_money_to_till(@drink2.price)
    assert_equal(1002, @Pub1.till)
  end

  def test_check_age()
    assert_equal(17, @customer1.age)
  end
  #no need for function as attr_reader access customer and gets the info from there

  def test_can_sell_drink__pass()
    @Pub1.sell_drink(@drink1.price, @customer2, @customer2.age, @customer2.drunkenness, @drink1.alcohol_level)
    assert_equal(15, @customer2.wallet)
    assert_equal(1005, @Pub1.till)
    assert_equal(2, @customer2.drunkenness)
  end

  def test_can_sell_drink__fail()
    @Pub1.sell_drink(@drink1.price, @customer1, @customer1.age, @customer1.drunkenness, @drink1.alcohol_level)
    assert_equal(100, @customer1.wallet)
    assert_equal(1000, @Pub1.till)
    assert_equal(0, @customer1.drunkenness)
  end

  def test_can_sell_drink__fail_drunkenness()
    @Pub1.sell_drink(@drink3.price, @customer2, @customer2.age, @customer2.drunkenness, @drink3.alcohol_level)
    assert_equal(20, @customer2.wallet)
    assert_equal(1000, @Pub1.till)
    assert_equal(30, @customer2.drunkenness)
  end


end
