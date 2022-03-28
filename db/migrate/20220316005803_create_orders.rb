class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id
      t.integer :order_system, default: 0
      t.time :time
      t.text :note
      t.integer :order_status, default: 0

      t.timestamps
    end
  end
end
