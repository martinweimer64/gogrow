class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.string :code
      t.datetime :order_date
      t.timestamps
      t.references :vendor
      t.references :buyer
    end
    add_foreign_key :sales, :users, column: :vendor_id, primary_key: :id
    add_foreign_key :sales, :users, column: :buyer_id, primary_key: :id
  end
end

