class RenamePageToContent < ActiveRecord::Migration
  def up
    rename_table :contents, :contents
  end

  def down
    rename_table :contents, :contents
  end
end
