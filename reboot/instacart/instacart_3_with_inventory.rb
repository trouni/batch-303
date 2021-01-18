# 1. Store availability and price in a hash of hashes
# 2. Update wherever we used the store hash
# 3. Display the available stock on the list
# After user input:
# 4. Check that there is stock available for that item (if statement)
# 5. If OK: Reduce the stock accordingly (+ add to cart)
# 6. If not OK: Display message "Sorry, no more."

# store = {
#   kiwi: 390,
#   banana: 100,
#   grapefruit: 1590,
#   grapes: 50
# }

store = {
  kiwi: {
    price: 390,
    stock: 10
  },
  banana: {
    price: 100,
    stock: 15
  },
  grapefruit: {
    price: 1590,
    stock: 1
  },
  grapes: {
    price: 50,
    stock: 3
  }
}

# cart = []
cart = {} # key: item, value: qty

puts '=' * 30
puts "  WELCOME TO GAVIN'S LAIR  "
puts '=' * 30

puts 'Here are the items we have in store today:'
store.each do |item, item_info| # item_info is a hash
  puts "#{item} - ¥#{item_info[:price]} (#{item_info[:stock]} in stock)"
end
puts '=' * 30

selected_item = 'start'
until selected_item.empty?
  puts 'Which item do you want? (Press ENTER to checkout)'
  selected_item = gets.chomp.to_sym

  if store.key?(selected_item)
    puts "How many #{selected_item} do you want?"
    selected_qty = gets.chomp.to_i

    if store[selected_item][:stock] > selected_qty
      store[selected_item][:stock] -= selected_qty

      if cart[selected_item]
        cart[selected_item] += selected_qty
      else
        cart[selected_item] = selected_qty
      end
    else
      puts "Sorry, we don't have enough #{selected_item}."
    end

  elsif selected_item.empty?
    break
  else
    puts "Sorry, we don't have #{selected_item} in our store."
    puts 'Please pick another product.'
  end
end

puts '=' * 30
puts "Thank you for shopping at Gavin's lair."

puts 'You ordered:'

cart_total = 0
cart.each do |item, qty|
  item_price = store[item][:price]
  subtotal = qty * item_price
  cart_total += subtotal
  puts "#{item.capitalize}: #{qty} x ¥#{item_price} = #{subtotal}"
end

puts "Your total is ¥#{cart_total}"
