class Customer
  attr_reader :wallet, :age, :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0
  end

  def remove_money_from_wallet(drinks)
    @wallet -= drinks
  end

  def buy_drink(drink, pub)
    remove_money_from_wallet(drink)
    pub.add_money_to_till(drink)
  end



end
