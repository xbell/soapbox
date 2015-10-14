require_relative 'bubble'

puts "What's your username?"
username = gets.chomp

body = ""
bubble_array = []

while body != "done"
  puts "What's on your mind?"
  body = gets.chomp
  bubble_info = {
    username: username,
    body: body,
    created_at: Time.now
  }

  bubble = Bubble.new(bubble_info)

  bubble_array.push(Bubble.new(bubble_info))

  bubble_array.each do |bubble|
    bubble.print_info

  puts "Anything else on your mind? Type \"yes\" or \"no\"."
  response = ""
  response = gets.chomp
  if response != "no"
    next
  else
    puts "Hope to hear from ya soon!"
    # done = ""
    # done = gets.chomp
    # if done == "exit"
      exit
    end
  end
end
