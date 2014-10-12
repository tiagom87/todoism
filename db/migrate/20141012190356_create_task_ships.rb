class CreateTaskShips < ActiveRecord::Migration
  def change
    create_table :task_ships do |t|
      t.integer :task_id
      t.integer :board_member_id

      t.timestamps null: false
    end
  end
end
