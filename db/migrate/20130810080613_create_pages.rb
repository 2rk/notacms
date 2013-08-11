class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
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
