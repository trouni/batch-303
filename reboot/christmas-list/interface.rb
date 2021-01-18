require_relative 'christmas_list'

gift_list = [
  # {
  #   name: "iPhone",
  #   price: 3_000_000,
  #   checked: false
  # }
]

puts
puts " .                    .           .    "
puts "      .         .                      "
puts "       WELCOME TO XMAS GIFT LIST       "
puts "            .              .       .   "
puts "    .                           .      "
puts "               .   *    .              "
puts "        .         ***       .          "
puts "           .     *****              .  "
puts "    .           *******    .           "
puts "             . *********         .     "
puts "__________________|_|__________________"
puts

user_input = ''
until user_input == 'quit'
  puts "What would you like to do? Please choose one of the options below:"
  puts "[ LIST | ADD | DELETE | MARK | IDEA | QUIT ]"
  print "> "
  user_input = gets.chomp.downcase.strip

  case user_input
  when 'list'
    display_list(gift_list)
  when 'add'
    puts 'Enter the name of your gift:'
    print '> '
    new_name = gets.chomp

    puts 'Enter the price of your gift:'
    print '> '
    new_price = gets.chomp.to_i

    gift_list << { name: new_name, price: new_price, checked: false }
    # new_gift = { name: new_name, price: new_price, checked: false }
    # gift_list << new_gift

    puts "#{new_name} has been added to your list."
    puts
  when 'delete'
    display_list(gift_list)
    puts 'Which item would you like to delete? (Enter the item number)'
    print '> '
    index_to_delete = gets.chomp.to_i - 1

    item_do_delete = gift_list[index_to_delete]
    puts "#{item_do_delete[:name]} has been deleted."
    puts

    gift_list.delete_at(index_to_delete)
  when 'mark'
    display_list(gift_list)
    puts 'Which item would you like to check/uncheck? (Enter the item number)'
    print '> '
    index_to_mark = gets.chomp.to_i - 1

    # if gift_list[index_to_mark][:checked]
    #   gift_list[index_to_mark][:checked] = false
    #   puts "#{gift_list[index_to_mark][:name]} is now unchecked."
    # else
    #   gift_list[index_to_mark][:checked] = true
    #   puts "#{gift_list[index_to_mark][:name]} is now checked."
    # end

    gift_list[index_to_mark][:checked] = !gift_list[index_to_mark][:checked]
    status = gift_list[index_to_mark][:checked] ? "checked" : "unchecked"
    puts "#{gift_list[index_to_mark][:name]} is now #{status}."
  when 'idea'
    puts 'What do you want to search for on Etsy?'
    print '> '
    keyword = gets.chomp

    puts 'Here are some gift suggestions from Etsy:'
    # display_list(etsy_search(keyword))
    etsy_results = etsy_search(keyword)
    display_etsy_list(etsy_results)

    puts 'Which item would you like to add to your list? (ENTER for none)'
    print '> '
    index_to_add = gets.chomp.to_i - 1

    if index_to_add.negative? # index_to_add = 0 - 1 if the user doesn't select a value
      puts 'No item was added to your list.'
    else
      item_to_add = etsy_results[index_to_add]
      gift_list << item_to_add
      puts "#{item_to_add[:name]} has been added to your list."
    end
  when 'quit' then break
  end

  # Adding a separator between questions
  puts
  puts "=" * 39
  puts
end












