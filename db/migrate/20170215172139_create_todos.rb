class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title
      t.boolean :completed, default: false
      t.integer :order, default: 0

      t.timestamps
    end
  end
end
