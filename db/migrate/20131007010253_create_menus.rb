class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :parent_id
      t.references :content
      t.string :name

      t.timestamps
    end
    add_index :menus, :content_id
  end
end
