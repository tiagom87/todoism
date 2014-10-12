class AddBoardIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :board_id, :integer
    remove_column :tasks, :user_id
  end
end
