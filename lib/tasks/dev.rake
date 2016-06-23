namespace :dev do

  task :fake_users => :environment do
    100.times do |i|
      User.create!( :email => Faker::Internet.email, :password => "12345678")
    end
  end

  task :fake_topics => :environment do
    Topic.delete_all

    categories = Category.all

    100.times do |i|
      puts "Generate #{i}"
      t = Topic.create!( :title => Faker::Commerce.product_name, :content => Faker::Lorem.paragraph )

      categories.sample( rand(10) ).each do |g|
        CategoryShip.create!( :topic => t, :category => g)
      end

    end
  end

end
