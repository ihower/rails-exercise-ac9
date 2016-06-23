namespace :dev do

  task :fake_users => :environment do
    100.times do |i|
      User.create!( :email => Faker::Internet.email, :password => "12345678")
    end
  end

  task :fake => :environment do
    100.times do |i|
      puts "Generate #{i}"
      Topic.create!( :title => Faker::Commerce.product_name, :content => Faker::Lorem.paragraph )
    end
  end

end
