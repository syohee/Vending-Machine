require "./drink"
require "./vending"

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
    puts "******menu******"
    puts "1 : input money"
    puts "2 : select drink"
    puts "3 : add drink"
    puts "****************"
    puts "投入金額 : " + $total.to_s
    vending.drink_list()
    print "menu select : "
    menu = gets.chomp
    if menu == "1"
      vending.input_money()
    elsif menu == "2"
      vending.buy()
    elsif menu == "3"
      print "name : "
      name = gets.chomp

      print "price : "
      price = gets.chomp
      while price.to_i == 0
        print "price error. Please again : "
        price = gets.chomp
      end

      print "stock : "
      stock = gets.chomp
      while stock.to_i == 0
        print "stock error. Please check : "
        stock = gets.chomp
      end

      print "maker : "
      maker = gets.chomp

      print "date : "
      date = gets.chomp
      regexp = /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/
      while date !~ regexp
        print "date format error. Please check (yyyy-mm-dd) : "
        date = gets.chomp
      end

      print "type ex)can, pet, pack : "
      type = gets.chomp
      while type != "can" && type != "pet" && type != "pack"
        print "type error. Please check (can, pet, pack) : "
        type = gets.chomp
      end

      main.add_drink(name, price, stock, maker, date, type)
    else
      puts "menu error"
    end
  end

  # @drink.each{|v| puts "現在のドリンク情報 : " + v.alldata.to_s}
  # puts "現在の売上金額 : " + @sales.to_s
end
