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

      cart[selected_item] = (cart[selected_item] || 0) + selected_qty
      # See NOTE 1 at the bottom of the file
    else
      puts "Sorry, we don't have enough #{selected_item}."
    end

  # See NOTE 2 at the bottom of the file
  elsif selected_item != ''
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

puts "Your total is: ¥#{cart_total}"




# NOTE 1:
#
# => value = (value || 0) + value_to_add
#
# ... is a one line equivalent of:
#
# => if value
# =>   value += value_to_add
# => else
# =>   value = value_to_add
# => end
#
# This is really not important for you to know now (if statement is fine),
# but feel free to come ask me if you want more explanations.

# NOTE 2:
#
# By checking that 'selected_item is not an empty string' first,
# the 'else' condition can now only be the empty string.
# Since we don't need any action for that, it can be removed completely.
# This saved us one condition (and the 'break') in our if statement.
