class Tweet

    attr_reader :user
    attr_accessor :message

    @@all = []

    def initialize(message, user)
        @message = message
        @user = user
        @@all << self
    end

    def self.all
        @@all
    end

    # username deliverable
    def username
        self.user.username 
        # or @user.username, or user.username - all will work
    end


end
