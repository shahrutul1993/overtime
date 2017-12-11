@user = User.create!(email: "test@test.com", 
						password: "asdfasdf", 
						password_confirmation: "asdfasdf",
						first_name: "rutul", 
						last_name: "shah"
						phone: "7049181544")
puts "1 user created"

AdminUser.create!(email: "admin@test.com", 
						password: "asdfasdf", 
						password_confirmation: "asdfasdf",
						first_name: "admin", 
						last_name: "user")

puts "1 adminuser created"

100.times do |post|
	Post.create(date: Date.today,
				rationale: "#{post} rationale content",user_id: @user.id)
end

puts "100 posts created"