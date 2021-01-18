require_relative 'calculator'

user_answer = 'y'
while user_answer == 'y'
	# Welcome user
	puts 'Welcome to the calculator'
	# Ask for a first number
	puts 'Enter a first number'
	print '> '
	first_number = gets.chomp.to_i
	# Ask for a second number
	puts 'Enter a second number'
	print '> '
	second_number = gets.chomp.to_i
	# Ask for an operation
	puts 'What operation + - * /?'
	operation = gets.chomp
	# Display result
	puts "Result: #{calculate(first_number, second_number, operation)}"
	# Loop

	puts 'Continue? [y/n]'
	user_answer = gets.chomp
end