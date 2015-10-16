class Bubble
  attr_accessor :username,
                :body,
                :created_at

    def initialize(attrs)
      @username = attrs[:username]
      @body = attrs[:body]
      @created_at = attrs[:created_at]
    end

    def print_info
      puts @username
      puts @body
      puts @created_at.strftime("%A, %d %b %Y %l:%M %p")
    end

    def save_bubble
      new_file = File.open("/Users/ebell/Code_Builders/Git_Hub_Work/soapbox/Bubbles/#{@body}", "w")
      new_file.write(@username)
      new_file.close
    end

end
