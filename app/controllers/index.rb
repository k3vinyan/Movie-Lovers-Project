
# get '/articles' do
#   @articles = Article.all
#   erb :index
# end

# get '/articles/:id' do
#   @article = Article.find(params[:id])
# end

# post '/articles' do
#   Article.create(params)
# end

get '/' do
  erb :index
end


post '/' do
	@user = User.find_by(username: params[:username])
	
	if @user == nil
		redirect '/'
	elsif @user.password == params[:password]
		redirect "/users/#{@user.id}"
	end
end

get '/users/:id' do
	@user = User.find(params[:id])
	erb :profile
end

get '/signup' do
	erb :sign
end

post '/signup' do
	@user = User.create(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], password: params[:password])
	redirect "/users/#{@user.id}"
end


get '/logout' do
	erb :index
end



