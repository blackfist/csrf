class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :text
      t.date :due_date
      t.integer :user_id

      t.timestamps
    end
  end
end
