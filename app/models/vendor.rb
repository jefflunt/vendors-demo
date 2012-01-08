class Vendor < ActiveRecord::Base
  has_many :sold_items, :class_name => "Item", :foreign_key => :seller_id
  has_many :manufactured_items, :class_name => "Item", :foreign_key => :manufacturer_id
end
