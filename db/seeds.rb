require 'faker'

#Create Topics
0.times do 
  Topic.create!(
    title: Faker::Lorem.word
    )
end

#Create Bookmarks
50.times do
  Bookmark.create!(
    url: Faker::Internet.url
    )
end

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"