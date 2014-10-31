get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/account' do
	redirect '/' if !current_user
	erb :account
end

post '/create_tweet' do
	current_user.tweets << Tweet.new(:content => params[:content])
	redirect '/account'
end


get '/search' do
  @users = User.where("#{:handle} LIKE (?)", "%#{params[:handle]}%")
  erb :list_users
end

get '/follow/:handle' do
  @user = User.find_by(handle: params[:handle])
  current_user.follow(@user)
  redirect '/account'
end

get '/followers' do
  @follows = Relationship.where(:followed_id => current_user.id)
  p "FOOOOOOKJSUG#{@follows.inspect}"
  @fdusers = find_followed(@follows)
  @fdusers.flatten!
  erb :followers
end

get '/following' do
  @follows = Relationship.where(:follower_id => current_user.id)
  @fusers = find_followers(@follows)
  @fusers.flatten!
  erb :following
end
