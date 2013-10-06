class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :content
      t.references :user
      t.integer :top
      t.integer :left
      t.integer :width
      t.integer :height
      t.boolean :minimised

      t.timestamps
    end
    add_index :positions, :content_id
    add_index :positions, :user_id
  end
end
