class Vending

  def initialize()
    @total = 0    #投入金額の総計
    @sales = 0    #売り上げ金額
    @money = [10, 50, 100, 500, 1000]  #投入可能お金
    @drink = [$cola, $redbull, $water] #drink 種類
    @stock = false
  end

  #投入
 def input_money()

   print "input money : "
   user_money = gets.chomp
   user_money = user_money.to_i

   if @money.include?(user_money)
     puts "投入金額 : " + (@total += user_money).to_s
     stock_check(@total)
     if @stock == true
       buy()
     else
       puts "投入金額不足"
       input_money()
     end
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
        @stock = true
      end }
 end

 def buy()

   print "select drink : "
   drink_name = gets.chomp

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

end
