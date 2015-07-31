10.times do 
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: Faker::Internet.password(4))
end

10.times do
	Movie.create(title: Faker::Hacker.verb, description: Faker::Lorem.paragraph(2, 2))
end
	
