require_relative 'bubble'


puts "What's your username?"
username = gets.chomp
puts "-" * 75

body = ""
bubble_array = []

while body != "Exit"
  puts "What's on your mind? Type \"Exit\" when finished."
  body = gets.chomp
  break if body.capitalize == "Exit"

  puts "-" * 75

  bubble_info = {
    username: username,
    body: body,
    created_at: Time.now
  }

  bubble = Bubble.new(bubble_info)

  bubble.save_bubble

  # save_bubble = File.open("/Users/ebell/Dropbox/SoapBox/" + bubble.body, "w")
  # save_bubble.write(bubble.username)
  # save_bubble.close

  bubble_array.push(bubble)

  bubble_array.each do |bubble|
    bubble.print_info
    puts "-" * 75

    # all_bubbles = Dir.glob("/Users/ebell/Dropbox/SoapBox/*")

  # puts "To post again, type \"Post\". Or type \"Refresh\" to refesh."
  # response = gets.chomp
  #
  # if response.capitalize == "Post" || response.capitalize =="Refresh"
  #   puts "-" * 75
  # else
  #   puts "Sorry I didn't get that."
  # end
  end
end

puts "-" * 75
puts "Hope to hear from ya soon!"
