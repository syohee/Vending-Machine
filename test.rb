#drink
class Drink
  def initialize(name, price, stock)
    @drink_name = name
    @drink_price = price
    @drink_stock = stock
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

# ドリンク オブジェクト
@cola = Drink.new("コーラ", 120, 5)
@redbull = Drink.new("レッドブル", 200, 5)
@water = Drink.new("水", 100, 5)

@total = 0    #投入金額の総計
@sales = 0    #売り上げ金額
@money = [10, 50, 100, 500, 1000]  #投入可能お金
@drink = [@cola, @redbull, @water] #drink 種類

#投入
def input_money(user_money)
  if @money.include?(user_money)
    puts "投入金額 : " + (@total += user_money).to_s
    stock_check(@total)
  else
    puts "釣り銭 : " + user_money.to_s
  end
end

#払い戻し操作
def output_money
    puts "釣り銭 : " + @total
end

def stock_check(total)
  @drink.each{ |v|
     if v.stock > 0 && v.price <= total
       puts "購入可能 : " + v.name.to_s
     end }
end

#
def buy(drink_name)
  @drink.each{ |v|
    if v.name == drink_name
      if v.stock > 0 && v.price <= @total
        v.set_stock v.stock - 1
        @sales += v.price
        @total -= v.price
        puts "釣り銭 : " + (@total).to_s
        @total = 0
      end
    end}
end

input_money 100
input_money 100
input_money 100
buy "コーラ"
buy "水"


@drink.each{|v| puts "現在のドリンク情報 : " + v.alldata.to_s}
puts "現在の売上金額 : " + @sales.to_s
