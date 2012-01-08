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
      10.times{Factory.create(:item, :seller_id => (rand(50) + 1), :manufacturer_id => (rand(50) + 1))}
      print (['\\', '/', '_', '|'])[rand(4)]
    end
    
    puts ""
  end
end
