require 'faker'
# Create Wikis 

10.times do
    user = User.create! :name => Faker::RickAndMorty.character, :email => Faker::Internet.email, :password => 'topsecret', :password_confirmation => 'topsecret'
end
users = User.all

50.times do
  Wiki.create!(
    title:  Faker::RickAndMorty.quote,
    body:   Faker::Markdown.emphasis,
    user:   users.sample, 
    is_private: false
  )
end
wikis = Wiki.all

10.times do
  Wiki.create!(
    title:  Faker::RickAndMorty.quote,
    body:   "Aha! I'm a private wiki!",
    user:   users.sample, 
    is_private: true
  )
end
wikis = Wiki.all


puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{users.count} users created"