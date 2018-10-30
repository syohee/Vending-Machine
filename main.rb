require "C:/Users/seonghee/Desktop/drink"
require "C:/Users/seonghee/Desktop/vending"

class Main
  # ドリンク オブジェクト
  $cola = Drink.new("cola", 120, 5)
  $redbull = Drink.new("redbull", 200, 5)
  $water = Drink.new("water", 100, 5)

  vending = Vending.new();

  while true
    vending.input_money()
  end

  # @drink.each{|v| puts "現在のドリンク情報 : " + v.alldata.to_s}
  # puts "現在の売上金額 : " + @sales.to_s
end
