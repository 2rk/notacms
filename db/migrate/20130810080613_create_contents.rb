class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.text :content
      t.integer :top
      t.integer :left
      t.integer :width
      t.integer :height
      t.timestamps
    end
  end
end
