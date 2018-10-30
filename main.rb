require "C:/Users/seonghee/Desktop/drink"
require "C:/Users/seonghee/Desktop/vending"

class Main
  # ドリンク オブジェクト
  $cola = Drink.new("cola", 120, 5)
  $redbull = Drink.new("redbull", 200, 5)
  $water = Drink.new("water", 100, 5)

  def add_drink(name, price, stock)
    name = name.to_s
    price = price.to_i
    stock = stock.to_i
    $drink.push(Drink.new(name, price, stock))
  end

  vending = Vending.new();
  main = Main.new();

  while true
    puts "menu"
    puts "1 : input money"
    puts "2 : add drink"
    menu = gets.chomp
    if menu == "1"
      vending.input_money()
    elsif menu == "2"
      print "name : "
      name = gets.chomp
      print "price : "
      price = gets.chomp
      print "stock : "
      stock = gets.chomp
      main.add_drink(name, price, stock)
    else
      puts "menu error"
    end
  end

  # @drink.each{|v| puts "現在のドリンク情報 : " + v.alldata.to_s}
  # puts "現在の売上金額 : " + @sales.to_s
end
