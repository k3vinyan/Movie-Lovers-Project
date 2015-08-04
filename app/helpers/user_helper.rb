helpers do

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def login
    	session[:user_id] = @user.id
      session[:username] = @user.username
  	end

  	def logged_in?
    	if session[:user_id] == @user.id
    	end
  	end

 	def logout
   		session[:user_id] = nil
      session[:username] = nil
 	end

  def find_movies(objects, search_word)
    movies_array = []
    objects.each do |movie|
      if movie.title.include?(search_word)
        movies_array << movie[:title]
      end
    end
  end

end

