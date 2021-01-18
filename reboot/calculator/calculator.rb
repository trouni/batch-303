def calculate(first_number, second_number, operation)
	[first_number.to_f, second_number].reduce(operation.to_sym)
	# case operation
	# when '+' then first_number + second_number
	# when '-' then first_number - second_number
	# when '*' then first_number * second_number
	# when '/' then first_number.to_f / second_number
	# end
end