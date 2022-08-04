class AddImageToMonkey < ActiveRecord::Migration[7.0]
  def change
    add_column :monkeys, :image, :text
  end
end
