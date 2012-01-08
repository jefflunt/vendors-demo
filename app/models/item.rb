class Item < ActiveRecord::Base
  belongs_to :seller, :class_name => "Vendor"
  belongs_to :manufacturer, :class_name => "Vendor"
end
