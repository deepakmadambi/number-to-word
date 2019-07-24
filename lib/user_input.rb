require_relative 'phone_number.rb'
require 'benchmark'
require 'bigdecimal/math'

# check whether number has length of 10 and doesnt include 0 and 1
def validate_number(number)
  if number.match(/\d[2-9]{9}/) && number.length == 10
    return true
  else
    return false
  end
end

# Get input from the user
def get_valid_phone_number
  puts "Enter phone number which doesn't have 0 and 1 as well as length of 10"
  num = gets.chomp
  if validate_number(num)
    num #return valid num
  else
    puts "You have entered Invalid Number."
    get_valid_phone_number # Get valid input from user
  end
end

phone_number = get_valid_phone_number # get valid phone_number
t1 = Time.now() # start time
results = PhoneNumber.new(phone_number).get_final_result #
t2 = Time.now() # End Time
puts "-"*30
puts results.inspect #print all valid word combinations
puts "-"*30
puts "Benchmark :In following order (User CPU Time, System CPU Time, User + System, Elapsed Real Time) "
puts Benchmark.measure { PhoneNumber.new(phone_number).get_final_result } #
puts "-"*30
