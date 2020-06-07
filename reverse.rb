

def my_reverse(string)
  reversed_string = ""
  last_char_index = -1
  while last_char_index.abs <= string.length do
    reversed_string += string[last_char_index]
    last_char_index -= 1
    # require 'pry';binding.pry
  end
  reversed_string
end

puts my_reverse("hello")
