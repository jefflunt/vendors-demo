namespace :db do  
  desc "Erase database"
  task :erase => :environment do
    puts "Erasing..."
    
    [Vendor, Item].each(&:delete_all)
  end
  
  desc "Erase and fill database"
  task :populate => [:environment, :erase] do
    require 'populator'
    require 'faker'
    
    puts "Populating: enjoy this random pattern generator while you wait..."
    
    50.times{Factory.create(:vendor)}
    Vendor.all.each do |v|
      # This line actually has a bug in it that makes all `seller_id` and `manufacturer_id`
      # columns always contain a value in the range 0..50. That means
      # `rake db:populate` will only actually work the first time, but
      # I think you get the idea of how this should work.
      10.times{Factory.create(:item, :seller_id => (rand(50) + 1), :manufacturer_id => (rand(50) + 1))}
      print (['\\', '/', '_', '|'])[rand(4)]
    end
    
    puts ""
  end
end
