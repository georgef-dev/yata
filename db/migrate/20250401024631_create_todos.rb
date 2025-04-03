class CreateTodos < ActiveRecord::Migration[8.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :label
      t.integer :priority
      t.datetime :due_date

      t.timestamps
    end
  end
end
