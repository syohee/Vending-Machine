require "C:/Users/seonghee/Desktop/drink"
require "C:/Users/seonghee/Desktop/vending"

class Main
  # ドリンク オブジェクト
  $cola = Drink.new("cola", 120, 5, "cocacola", "2019-10-30", "can")
  $redbull = Drink.new("redbull", 200, 5, "redbull", "2019-11-29", "can")
  $water = Drink.new("water", 100, 5, "samda", "2020-9-19", "pet")

  def add_drink(name, price, stock, maker, date, type)
    price = price.to_i
    stock = stock.to_i
    $drink.push(Drink.new(name, price, stock, maker, date, type))
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
      print "maker : "
      maker = gets.chomp
      print "date : "
      date = gets.chomp
      print "type ex)can, pet, pack : "
      type = gets.chomp
      main.add_drink(name, price, stock, maker, date, type)
    else
      puts "menu error"
    end
  end

  # @drink.each{|v| puts "現在のドリンク情報 : " + v.alldata.to_s}
  # puts "現在の売上金額 : " + @sales.to_s
end
