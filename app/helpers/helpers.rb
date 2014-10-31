helpers do

	def current_user
		return nil if !session[:user_id]
		@current_user ||=  User.find(session[:user_id])
	end

	def followed_tweets
		follow_array=[]
		current_user.followeds.each do |person_you_follow|
			follow_array << person_you_follow.id
		end
		Tweet.where(user_id: follow_array).limit(10).order('id desc')
	end

	def handle_from_tweet(tweet)
		User.find(tweet.user_id).handle
	end

	def find_followers(follows)
		followers_array = []
		follows.each do |find|
			followers_array << User.where(:id => find.id)
		end
		followers_array
	end

	def find_followed(follows)
		followed_array = []
		follows.each do |find|
			followed_array << User.where(:id => find.follower_id)
		end
		followed_array
	end
end
