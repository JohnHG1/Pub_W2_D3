class Pub
  attr_reader :till
  def initialize(name, till)
    @name = name
    @till = till
    @drinks = []
  end

  def num_of_drinks()
    @drinks.count
  end

  def add_drinks(drinks_to_add)
    @drinks.push(drinks_to_add)
  end

  def add_money_to_till(drink_sale)
    @till += drink_sale
  end

  def take_drinks(drinks_to_take)
    for customer_drink in @drinks
      if customer_drink == drinks_to_take
        @drinks.delete(drinks_to_take)
      end
    end
  end

  def sell_drink(drink, customer, age, drunkenness, alcohol_level)
    while drunkenness < 10
      if age >= 18
        customer.remove_money_from_wallet(drink)
        add_money_to_till(drink)
        customer.increase_drunkenness(alcohol_level)
      else return false
      end
    end
  end


end
