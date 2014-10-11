class AddArchivedAtToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :archived_at, :datetime
  end
end
