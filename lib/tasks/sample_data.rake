namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Tim",
                 email: "tim@sg1.com",
                 password: "password",
                 password_confirmation: "password")
                 admin.toggle!(:admin)
    25.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@schoolreport.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)                  
    end 
       
    users = User.all    
    3.times do
      content = Faker::Lorem.sentence(5)
      title = Faker::Company.bs 
           
      users.each do |user| 
        topic = user.topics.create!(content: content, title: title)
                  
        4.times do
          r = Random.rand(20) +1
          content = Faker::Lorem.sentence(5)                 
          topic.replies.create!(content: content, user_id: r)
        end   
      end   
    end   
  end
end

