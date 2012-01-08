class VendorAndItemModels < ActiveRecord::Migration
  def up
    create_table :vendors do |t|
      t.string  :name
      t.string  :website
      t.string  :abbr
    end
    
    create_table :items do |t|
      t.integer :seller_id
      t.integer :manufacturer_id
      t.string  :name
    end
  end

  def down
    drop_table :vendors
    drop_table :items
  end
end
