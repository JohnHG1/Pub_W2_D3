require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class TestDrink < MiniTest::Test

  def setup
    @drink1 = Drink.new("Rum", 5, 2)
    @drink2 = Drink.new("Beer", 2, 1)
    @drink3 = Drink.new("Liver_failure", 20, 30)

  end


end
