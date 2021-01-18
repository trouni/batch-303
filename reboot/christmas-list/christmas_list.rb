require 'open-uri'
require 'nokogiri'

def display_list(list)
  puts 'Currently no item in your list.' if list.empty?

  list.each_with_index do |gift, index|
    puts "#{index + 1} - #{gift[:checked] ? "[X]" : "[ ]"} #{gift[:name]} ($#{gift[:price]})"
  end
end

def display_etsy_list(list) # Same as display_list, but without the checkbox
  list.each_with_index do |gift, index|
    puts "#{index + 1} - #{gift[:name]} ($#{gift[:price]})"
  end
end

def etsy_search(keyword)
  html_content = open("https://www.etsy.com/search?q=#{keyword}").read

  doc = Nokogiri::HTML(html_content)

  results = []
  doc.search('.v2-listing-card').first(4).each do |element|
    price = element.search('.currency-value').text.strip.to_f
    name = element.search('h2').text.strip
    stripped_name = name.split(" ").first(5).join(" ")

    results << { name: stripped_name, price: price, checked: false }

    # etsy_item = {
    #   name: name,
    #   price: price,
    #   checked: false
    # }
    # results << etsy_item
  end
  return results
end






