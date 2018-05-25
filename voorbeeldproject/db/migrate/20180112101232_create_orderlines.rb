class CreateOrderlines < ActiveRecord::Migration[5.1]
  def change
    create_table :orderlines do |t|
      t.column :order_id, :integer
      t.column :product_name, :string
      t.column :price, :decimal
      t.column :quantity, :decimal

      t.timestamps
    end
  end
end
