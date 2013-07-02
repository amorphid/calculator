# NOTES:

# This was my first whack at evaluating basic math in a string
# Examples:  "2+2" evaluates to "4", "45 - 42" evaluates to "3"
# Since class isn't using tests, I chose to write without using tests
# Haven't yet implemented memory, which is commented out in calculater face
# Only handles integers.  Haven't built in logic for floats yet.
# To execute, run "app"

def calculator_face
  text = ""

  # text << "m+ m- mc mr\n"
  text << "7  8  9  /\n"
  text << "4  5  6  *\n"
  text << "1  2  3  -\n"
  text << "0  .  C  +\n"

  text
end

def parse(user_input)
  no_spaces = user_input.gsub(" ", "")
  split_array = no_spaces.split("")
  limit = split_array.length - 1

  num1 = ""
  stack = ""
  oper = ""

  0.upto(limit) do |i|
    case split_array[i]
    when /^\d/
      stack << split_array[i]
    when /^\D/
      num1 = stack
      stack = ""
      oper << split_array[i]
    end
  end

case
  when num1.empty?
    syntax_error(user_input)
  when stack.empty?
    syntax_error(user_input)
  when oper == "/"
    "RESULT:  #{num1} divided by #{stack} is #{num1.to_i / stack.to_i}\n"
  when oper == "*"
    "RESULT:  #{num1} multiplied by #{stack} is #{num1.to_i * stack.to_i}\n"
  when oper == "-"
    "RESULT:  #{num1} minus #{stack} is #{num1.to_i - stack.to_i}\n"
  when oper == "+"
    "RESULT:  #{num1} plus #{stack} is #{num1.to_i + stack.to_i}\n"
  else
    syntax_error(user_input)
  end
end

def syntax_error(user_input)
  text = ""

  text << "SYNTAX ERROR:\n"
  text << "  \"#{user_input}\" is not a valid command.\n"
  text << "  Proper format:  number1 operator number2\n"
  text << "  Examples:  2 / 3, 4 * 5, 33 - 12, 7 + 0\n"

  text
end

def app
  while true
    puts
    puts "CALCULATOR"
    puts
    puts calculator_face
    puts
    puts "Enter command (number1 operator number2):  "

    user_input = gets.chomp
    break if user_input.empty?

    puts
    puts parse(user_input)
  end
end

app
