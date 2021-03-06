post '/signup' do
	new_user = User.create(:name => params[:name], :handle => params[:handle],
				:password => params[:password])
	session[:user_id] = new_user.id
	redirect '/account'
end

post '/login' do
	current_user = User.find_by(handle: params[:handle], password: params[:password])

	if current_user
		session[:user_id] = current_user.id
		redirect('/account')
	else
		redirect '/'
	end
end

get '/log_out' do
  current_user = session[:user_id]
  session[:user_id] = nil
  redirect '/'
end

get '/list_users' do
	@users = User.where.not(id: current_user)
	erb :list_users
end

get '/view/:handle' do
	@user = User.find_by(handle: params[:handle])
	erb :single_account_view
end
