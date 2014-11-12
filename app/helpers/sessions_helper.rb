module SessionsHelper
	################################
	# Ensure current_user returns 
	#    a User object from MongoDB
	################################

	# LOG IN: set user ID cookie in user's browser
	def log_in(user)
		cookies.permanent[:logged_in_id] = user.id
		#session[:userid] = user.id
		@current_user = user
		@current_zip = user.zip
	end

	# LOG OUT: remove cookie from user's browser
	def log_out
		cookies.delete(:logged_in_id)
	end

	# true if user logged in
	def logged_in?
		cookies[:logged_in_id] ? true : false

	end


	################################
	# Ensure current_user returns 
	#    a User object from MongoDB
	################################

	# If not already set, retrieve user from MongoDB
	def current_user
		# mobile errors here
		if logged_in? && cookies[:logged_in_id] != nil
			@current_user ||= User.find(cookies[:logged_in_id])
		else
			nil
		end
	end

	# current_user Setter (similar to attr_writer)
	def current_user=(user)
		@current_user = user
		@current_zip = user.zip
	end
end