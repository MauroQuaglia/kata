class Shopper

  def initialize(shopping_list)
    @shopping_list = shopping_list
  end

  def goods
    @shopping_list.split("\n")
  end

end
