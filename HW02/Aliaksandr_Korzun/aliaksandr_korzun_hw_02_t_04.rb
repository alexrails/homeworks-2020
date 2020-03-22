print "Enter string: "
string = gets.chomp

LETTERS_TEMPLATE = /[a-zа-я]/
DIGITS_TEMPLATE = /\d/

def count_letters_and_digits(string)
  p "letters: " + "#{ string.scan(LETTERS_TEMPLATE).count }"
  p "digits: " + "#{ string.scan(DIGITS_TEMPLATE).count }"
end

count_letters_and_digits(string)



