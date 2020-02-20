class User

    attr_reader :username

    def initialize(username)
        @username = username
    end

    def tweets
        # first i need all the tweets, then i need to go through the tweets and pick out moxxie's
        Tweet.all.select do |tweet|
            tweet.user == self
        end
    end

    #post tweets deliverable
    def post_tweet(message)
        # i need to make a new tweet, and give it a message, and assign it to SELF = user (instance of user)
        Tweet.new(message, self)
    end


end


