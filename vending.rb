class Vending

  def initialize()
    $total = 0    #投入金額の総計
    @sales = 0    #売り上げ金額
    @money = [10, 50, 100, 500, 1000]  #投入可能お金
    $drink = [$cola, $redbull, $water] #drink 種類
    @stock = false
  end

  #投入
 def input_money()
   print "input money : "
   user_money = gets.chomp
   user_money = user_money.to_i
   if @money.include?(user_money)
     $total += user_money
     puts "total money : " + $total.to_s
     stock_check()
   else
     puts "money error - repay : " + user_money.to_s
     input_money()
   end
 end

  #払い戻し操作
 def output_money
     puts "釣り銭 : " + $total.to_s
     $total = 0
 end

 def stock_check()
   $drink.each{ |v|
      if v.stock > 0 && v.price <= $total
        @stock = true
      end }
    if @stock == true
      while true
        drink_list()
        print "To put more money? (yes or no) : "
        answer = gets.chomp
        if answer == "yes"
          input_money()
          return
        elsif answer == "no"
          return
        else
          puts "answer error"
        end
      end
    else
      input_money()
    end
 end

 def buy()
   print "select drink : "
   drink_name = gets.chomp

   $drink.each{ |v|
     if v.name == drink_name
       if v.stock > 0 && v.price <= $total
         v.set_stock v.stock - 1
         @sales += v.price
         $total -= v.price
         puts "釣り銭 : " + ($total).to_s
         $total = 0
       else
         puts "buy error"
       end
     end}
 end

 def drink_list()
   puts "┌────────────────────────────────────────────────drink list──────────────────────────────────────┐"
   $drink.each{|v|
     if v.stock > 0 && v.price <= $total
       puts v.alldata.to_s + " -- 購入可能"
     else
       puts v.alldata.to_s + " -- 購入不可"
     end}
   puts "└────────────────────────────────────────────────────────────────────────────────────────────────┘"
 end

end
