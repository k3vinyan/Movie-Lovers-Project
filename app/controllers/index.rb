get '/' do
  erb :index
end


post '/' do
	@user = User.find_by(username: params[:username])
	if @user == nil
		p @user
		create_warning
		redirect '/'
	elsif @user.password == params[:password]
		redirect "/users/#{@user.id}"
	else
		create_warning
		redirect '/'
	end
end

# post '/' do
#   @user = User.find_by(username: params[:username])
#   if @user == nil
#     create_warning
#     redirect '/login'
#   elsif @user.password_hash == params[:password_hash]
#     login #starts session for that user
#     erb  :profile
#     elsif params[:password_hash] == "" || params[:password_hash] = nil
#     create_warning
#     redirect '/login'
#      # OPTIMIZATION:  User.authenticate(params[:username], params[:password_hash])
#   else
#     create_warning
#     redirect '/login'
#   end
# end

get '/users/:id' do
	@movies = Movie.all.limit(5).pluck(:poster)
	@comments = Comment.all
	erb :profile
end
	
post '/users/:id' do
	@movies = Movie.where(params[:title])
	redirect "/users/#{params[:id]}/movies"
end

get '/users/:id/movies' do
	@movies = Movie.where(params[:title])
	erb :profile
end

post '/users/:id/movies' do
	@movies = find_movies(Movie.all, params[:title])
	erb :profile
end

get '/users/:id/movies/:id' do
	@movie = Movie.find(params[:id])
	erb :profile
end

post '/users/:id/movies/:id' do
end

get '/signup' do
	erb :sign
end



post '/signup' do
	@user = User.create(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], password: params[:password])
	redirect "/users/#{@user.id}"
end

get '/logout' do
	logout
	erb :index
end



