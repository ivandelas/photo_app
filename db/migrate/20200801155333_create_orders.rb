class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status, default: 0
      t.string :token
      t.string :charge_id
      t.string :error_message
      t.string :costumer_id

      t.timestamps
    end
    add_money :orders, :price, currency: { present: false }
  end
end
