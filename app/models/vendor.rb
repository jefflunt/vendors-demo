class Vendor < ActiveRecord::Base
  has_many :items
  has_many :sold_items, :through => :items
  has_many :manufactured_items, :through => :items
end
