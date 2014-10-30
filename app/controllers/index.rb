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
