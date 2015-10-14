require_relative 'bubble'

puts "What's your username?"
username = gets.chomp
puts "-----------------------------------------------------------------------"

body = ""
bubble_array = []

while body != "nothing"
  puts "What's on your mind? Type \"nothing\" when finished."
  body = gets.chomp

  puts "-----------------------------------------------------------------------"

  bubble_info = {
    username: username,
    body: body,
    created_at: Time.now
  }

  bubble = Bubble.new(bubble_info)

  bubble_array.push(bubble)

  bubble_array.each do |bubble|
    bubble.print_info
  puts "-----------------------------------------------------------------------"
  next
  end
  if body == "nothing"
    puts "Hope to hear from ya soon!"
    exit
  end
end
