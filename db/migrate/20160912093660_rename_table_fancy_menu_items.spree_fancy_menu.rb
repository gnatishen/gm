# This migration comes from spree_fancy_menu (originally 20131031180854)
class RenameTableFancyMenuItems < ActiveRecord::Migration
  def change
  	rename_table :fancy_menu_items, :spree_fancy_menu_items
  end
end
