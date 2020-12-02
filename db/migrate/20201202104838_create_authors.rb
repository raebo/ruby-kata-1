class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :email, null: false
      t.string :prename, null: false
      t.string :lastname, null: false
      t.timestamps
    end
  end
end
