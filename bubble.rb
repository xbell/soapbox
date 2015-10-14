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
      puts @created_at
    end

end
