class CreateAttends < ActiveRecord::Migration
  def change
    create_table :attends do |t|
      t.string :name
      t.boolean :attend
      t.string :payment
      t.text :comment

      t.timestamps
    end
  end
end
