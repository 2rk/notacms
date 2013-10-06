class ChangePageToContentInPositions < ActiveRecord::Migration
  def up
    rename_column :positions, :page_id, :content_id
  end

  def down
    rename_column :positions, :content_id, :page_id
  end
end
