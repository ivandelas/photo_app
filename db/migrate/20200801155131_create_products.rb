class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :stripe_plan_name

      t.timestamps
    end
    add_monetize :products, :price, currency: { present: true }
  end
end
