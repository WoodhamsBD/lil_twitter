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
  p User.first.handle
  @user = User.find_by(handle: params[:handle])
  p @user
  p params[:handle]
  current_user.follow(@user)
  redirect '/account'
end
