namespace :dev do

  task :fake => :environment do
    100.times do |i|
      puts "Generate #{i}"
      Topic.create!( :title => Faker::Commerce.product_name, :content => Faker::Lorem.paragraph )
    end
  end

end
