require_relative 'bubble'
require_relative 'soapboxfiles'
require 'colorize'

puts "welcome to soapbox".upcase.bold.magenta.underline
username = ""
# check if .soapbox file exists
if File.exist?("/Users/ebell/Code_Builders/Git_Hub_Work/soapbox/.soapbox")
  # if .soapbox exists, open .soapbox file
  username_file = File.open("/Users/ebell/Code_Builders/Git_Hub_Work/soapbox/.soapbox")
  username = username_file.read
else
  puts "What's your username?".green
  username = gets.chomp
  puts ("-" * 75).blue
  # save username to .soapbox file
  username_file = File.open("/Users/ebell/Code_Builders/Git_Hub_Work/soapbox/.soapbox", "w")
  username_file.write(username)
  username_file.close
end

body = ""

Dir.chdir("/Users/ebell/Dropbox/SoapBox/")

while body != "Exit"
  bubble_array = []
  all_bubbles = SoapboxFiles.read

  # putting our bubbles in order by least recent to most recent
  SoapboxFiles.sort(all_bubbles)

  all_bubbles.each do |bubbles|
    bubble_file = File.open(bubbles)
    bubble_info = {    #username: File.open(bubbles) {|bubble| bubble.readline}.chomp
      username: bubble_file.read,
      body: bubbles,
      created_at: File.mtime(bubbles)
    }
    bubble = Bubble.new(bubble_info)
    bubble_array.push(bubble)
  end

  puts "What's on your mind? Press enter to Post, or type \"Refresh\" to refresh, or \"Exit\" when finished.".green
  body = gets.chomp
  break if body.capitalize == "Exit"
  if body.capitalize == "Refresh"
    bubble_array.each do |bubble|
      bubble.print_info
      puts ("-" * 75).blue
    end
    next
  end

  puts ("-" * 75).blue

  bubble_info = {
    username: username,
    body: body,
    created_at: Time.now
  }

  bubble = Bubble.new(bubble_info)

  bubble.save

  bubble_array.push(bubble)

  bubble_array.each do |bubble|
    bubble.print_info
    puts ("-" * 75).blue
  end
end

puts ("-" * 75).blue
puts "Hope to hear from ya soon!".green
