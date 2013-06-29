require "pry"

def say(message)
  puts "--#{message}--"
end

puts "What's the first number?"
num1 = gets.chomp

puts "What's the second number?"
num2 = gets.chomp

puts "What would you like to do?  1) add 2) subtract 3) multiply 4) divide"
operation = gets.chomp
result = nil

case operation
when "1"
  result = num1.to_i + num2.to_i
when "2"
  result = num1.to_i - num2.to_i
when "3"
  result = num1.to_i * num2.to_i
when "4"
  result = num1.to_i / num2.to_i
end

say("The result was #{result}")
