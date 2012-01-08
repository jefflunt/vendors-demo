require 'populator'
require 'faker'

FactoryGirl.define do

  factory :vendor do |v|
    v.name            {Populator.words(1..3)}
    v.website         {Faker::Internet.domain_name}
    v.abbr            {(["ABC", "DEF", "GHI", "JKL", "MNO", "PQR", "STU", "VWX", "YZ1"])[rand(9)]}
  end

  factory :item do |i|
    i.association :seller, :factory => :vendor
    i.association :manufacturer, :factory => :vendor
    i.name  {Populator.words(3..5)}
  end
  
end
