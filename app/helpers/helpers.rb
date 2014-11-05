helpers do

	def current_user
		return nil if !session[:id]
		@current_user ||=  User.find(session[:id])
	end


end
