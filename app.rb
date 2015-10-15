require_relative 'bubble'

puts "What's your username?"
username = gets.chomp
puts "-" * 75

body = ""
bubble_array = []

while body != "nothing"
  puts "What's on your mind? Type \"nothing\" when finished."
  body = gets.chomp
  break if body == "nothing"

  puts "-" * 75

  bubble_info = {
    username: username,
    body: body,
    created_at: Time.now
  }

  bubble = Bubble.new(bubble_info)

  bubble_array.push(bubble)

  bubble_array.each do |bubble|
    bubble.print_info
    puts "-" * 75
  end
end

puts "-" * 75
puts "Hope to hear from ya soon!"
