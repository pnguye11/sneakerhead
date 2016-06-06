class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.float :size
      t.string :name
      t.string :brand
      t.integer :price
      t.string :condition
      t.string :color
      t.text :notes
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
