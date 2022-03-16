class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      
      t.string :product_name
      t.string :price
      t.integer :max_quantity
      t.integer :product_status, default: 0

      t.timestamps
    end
  end
end
