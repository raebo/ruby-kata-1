class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :type, null: false
      t.string :title, null: false
      t.string :isbn, null: false
      t.text :description, null: false
      t.date :published_at
      t.timestamps
    end

    create_table :authors_products do |t|
      t.integer :author_id
      t.integer :product_id
      t.timestamps
    end
  end
end
