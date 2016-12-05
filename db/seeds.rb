10.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "password")
end

10.times do
  Post.create(title: Faker::Name.title, body: Faker::Hipster.paragraph, user_id: rand(11))
end

20.times do
  Comment.create(text: Faker::Hipster.sentence, user_id: rand(11), post_id: rand(11))
end
