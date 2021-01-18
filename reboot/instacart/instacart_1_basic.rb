# 1. Initialize a hash for the store items (key = fruit name, value = price)
store = {
  kiwi: 390,
  banana: 100,
  grapefruit: 1590,
  grapes: 50
}

# 2. Initialize the shopping cart as an empty array
cart = []

# 3. Display a welcome message
puts "=" * 30
puts "  WELCOME TO GAVIN'S LAIR  "
puts "=" * 30

# 4. Display the items in the store
puts "Here are the items we have in store today:"
store.each do |item, price|
  puts "#{item.capitalize} - ¥#{price}"
end
puts "=" * 30

selected_item = "start"
until selected_item.empty?
  # 5. Ask the user what item they want to buy (give an option to checkout)
  puts "Which item do you want? (Press Enter to checkout)"

  # 6. Store the item using gets.chomp
  selected_item = gets.chomp

  # 7. Add the item to the shopping cart (array)
  if store.key?(selected_item.to_sym)
    cart << selected_item
  elsif selected_item.empty?
    break
  else
    puts "Sorry, we don't have #{selected_item} in our store. Please pick another product."
  end
  # same as cart.push(selected_item)
end

# p cart

cart_total = 0
cart.each do |item|
  cart_total += store[item.to_sym]
end

# 10. Give the user the total price for his shopping
puts "=" * 30
puts "Thank you for shopping at Gavin's lair."
puts "You ordered: #{cart.join(", ")}."
puts "Your total is ¥#{cart_total}"
