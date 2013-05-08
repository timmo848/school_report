namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
                 admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)                  
    end    
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      title = Faker::Lorem.words(1)
      users.each { |user| user.topics.create!(content: content, title: title) }    
    end
    topics = Topic.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      topics.each { |topic| topic.replies.create!(content: content) }    
    end
  end
end

