require 'pry'
class Buyer
  attr_accessor :money
  def initialize (money)
    @money = money 
  end

end


MAIN = [
  {name: "spaghetti", price: 8.99}, 
  {name: "chicken nuggets", price: 5.99},
  {name: "cheesesteak", price: 10.54},
  {name: "pasta salad", price: 3.99}, 
  {name: "sushi", price: 9.99}]
  
  SIDES = [
    {name: "pudding", price: 1.75},
    {name: "fries", price: 3.99},
    {name: "salad", price: 3.99},
    {name: "fruit bowl", price: 2.50},
    {name: "pie", price: 2.25}
  ]
  
  DRINKS = [
    {name: "water", price: 0},
    {name: "soda", price: 1.50},
    {name: "juice", price: 2.25},
    {name: "coffee", price: 1.50},
    {name: "tea", price: 1.50}
  ]
  
ITEMS = []
class Lunchroom
  
  def initialize 
    @buyer = Buyer.new(20)
    running_order
  end

  def running_order 
    welcome
    main
    side1
    side2
    drinks
    order
  end

  def item_list(food)
  food.each_with_index do |item, i| 
    puts "#{i + 1}) #{item[:name]} $#{item[:price]}"
  end
end

def welcome
  puts "welcome to the Lunch Lady Cafeteria."
  puts "What is your name?"
  name = gets.strip
  puts "#{name} you have $#{@buyer.money} for lunch."
end

  def main
    puts "-------------"
    puts "What main dish would you like?"
    item_list(MAIN)
      main_order = gets.strip.to_i
      if main_order == 1 || main_order == 2 || main_order == 3 || main_order == 4 || main_order == 5
      main_dish = MAIN[main_order - 1]
      ITEMS << main_dish
      puts "You ordered #{main_dish[:name]}."
      else 
        puts "Sorry that's not an option."
        running_order
      end
    end

  
  def side1
    puts "What side dish would you like?"
    item_list(SIDES)
    side_order = gets.strip.to_i
    if side_order == 1 || side_order == 2 || side_order == 3 || side_order == 4 || side_order == 5      
    side_dish = SIDES[side_order - 1]
    ITEMS << side_dish
    puts "You ordered #{side_dish[:name]}."
  else 
    puts "Sorry that's not an option."
    running_order
  end
end

  def side2
    puts "What other side dish would you like?"
    item_list(SIDES)
    side_order = gets.strip.to_i
    if side_order == 1 || side_order == 2 || side_order == 3 || side_order == 4 || side_order == 5            
    side_dish2 = SIDES[side_order - 1]
    ITEMS << side_dish2
    puts "You ordered #{side_dish2[:name]}."
  else 
    puts "Sorry that's not an option."
    running_order
  end
end
  
  def drinks
    puts "What drink would you like?"
    item_list(DRINKS)
    drink_order = gets.strip.to_i
    if drink_order == 1 || drink_order == 2 || drink_order == 3 || drink_order == 4 || drink_order == 5                  
    drink = DRINKS[drink_order - 1]
    ITEMS << drink
    puts "You ordered #{drink[:name]}."
  else 
    puts "Sorry that's not an option."
    running_order
  end
  end

  def order
    puts " ---------------"
    puts "Your final order contains: "
    ITEMS.each do | dish | 
      print "#{dish[:name]},"
    end
    total
  end 

  def total 
    total = []
    ITEMS.each do | cost |
      total << cost[:price]
    end
    sum = total.reduce(&:+)
    if @buyer.money < sum 
    puts "You can't afford that much food!"
    running_order
    else
      puts ""
      puts "Your total is $#{sum}."
      puts "Your wallet has $#{@buyer.money - sum} remaining."
    end 
  end
end

Lunchroom.new


