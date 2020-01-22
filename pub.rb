class Pub
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

  def take_drinks(drinks_to_take)
    for customer_drink in @drinks
      if customer_drink == drinks_to_take
        @drinks.delete(drinks_to_take)
      end
    end
  end


end
