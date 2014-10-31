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
end