@user = User.create!(email: "test@test.com", 
						password: "asdfasdf", 
						password_confirmation: "asdfasdf",
						first_name: "rutul", 
						last_name: "shah")

100.times do |post|
	Post.create(date: Date.today,
				rationale: "#{post} rationale content")
end

puts "100 posts created"