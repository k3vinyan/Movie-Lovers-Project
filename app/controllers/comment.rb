get '/profile' do	
	erb :profile
end

post '/profile' do
	post_commment = Comment.create(comment: params[:comment], user_id: id, movie_id: id)

	redirect '/profile'
end
