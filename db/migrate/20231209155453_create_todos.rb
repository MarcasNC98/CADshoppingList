class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.string :item
      t.boolean :purchased

      t.timestamps
    end
  end
end
