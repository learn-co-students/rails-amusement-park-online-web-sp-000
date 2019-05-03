module UsersHelper

	def admin
		self.current_user.admin
	end

	def current_user
		if session[:user_id]
			User.find(session[:user_id])
		else
			nil
		end
	end
	
	def logged_in?
		!!session[:user_id]
	end

	def users_page?
		session[:user_id] == params[:id].to_i
	end
end
