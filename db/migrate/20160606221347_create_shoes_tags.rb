class CreateShoesTags < ActiveRecord::Migration
  def change
    create_table :shoes_tags do |t|
      t.references :shoe, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
