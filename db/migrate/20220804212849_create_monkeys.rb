class CreateMonkeys < ActiveRecord::Migration[7.0]
  def change
    create_table :monkeys do |t|
      t.string :name
      t.integer :age
      t.text :enjoys
      t.text :imgage

      t.timestamps
    end
  end
end
