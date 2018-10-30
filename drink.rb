#drink
class Drink
  def initialize(name, price, stock, maker, date, type)
    @drink_name = name
    @drink_price = price
    @drink_stock = stock
    @drink_maker = maker
    @drink_date = date
    @drink_type = type
  end
  def name
    @drink_name
  end
  def price
    @drink_price
  end
  def stock
    @drink_stock
  end
  def set_stock(stock)
    @drink_stock = stock
  end
  def alldata
    "name : " + @drink_name.to_s + ", price : " + @drink_price.to_s + ", stock : " + @drink_stock.to_s
  end
end
