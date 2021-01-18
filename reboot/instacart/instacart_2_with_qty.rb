# 1. Decide where to ask for qty
# 2. Ask for the qty to the user using qty = gets.chomp and store it
# 3. Store the item & qty in the hash: cart[item] = qty
# 4. Display the details of the bill

store = {
  kiwi: 390,
  banana: 100,
  grapefruit: 1590,
  grapes: 50
}

# cart = []
cart = {} # key: item, value: qty

puts "=" * 30
puts "  WELCOME TO GAVIN'S LAIR  "
puts "=" * 30

puts "Here are the items we have in store today:"
store.each do |item, price|
  puts "#{item.capitalize} - ¥#{price}"
end
puts "=" * 30

selected_item = "start"
until selected_item.empty?
  puts "Which item do you want? (Press Enter to checkout)"
  selected_item = gets.chomp

  if store.key?(selected_item.to_sym)
    puts "How many of #{selected_item} do you want?"
    selected_qty = gets.chomp.to_i

    if cart[selected_item]
      cart[selected_item] += selected_qty
    else
      cart[selected_item] = selected_qty
    end
  elsif selected_item.empty?
    break
  else
    puts "Sorry, we don't have #{selected_item} in our store. Please pick another product."
  end
  # same as cart.push(selected_item)
end

puts "=" * 30
puts "Thank you for shopping at Gavin's lair."

puts "You ordered:"

cart_total = 0
cart.each do |item, qty|
  item_price = store[item.to_sym]
  subtotal = qty * item_price
  cart_total += subtotal
  puts "#{item.capitalize}: #{qty} x ¥#{item_price} = #{subtotal}"
end

puts "Your total is ¥#{cart_total}"
