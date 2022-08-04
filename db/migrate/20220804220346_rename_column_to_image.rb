class RenameColumnToImage < ActiveRecord::Migration[7.0]
  def change
    rename_column :monkeys, :imgage, :image
  end
end
