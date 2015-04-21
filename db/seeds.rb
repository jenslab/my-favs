require 'faker'

#Create User
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

#Create Topics
5.times do 
  Topic.create!(
    user_id: users.sample.id, 
    title: Faker::Lorem.word
    )
end
topics = Topic.all

#Create Bookmarks
50.times do
  Bookmark.create!(
    topic_id: Topic.all.sample.id, 
    user_id: users.sample.id,
    url: Faker::Internet.url
    )
end
bookmarks = Bookmark.all

#Create an admin user
admin = User.new(
  name: 'Jen',
  email: 'palacios.jennifer@gmail.com',
  password: 'helloworld'
  )

admin.skip_confirmation!
admin.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"