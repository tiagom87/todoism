class CreateBoardMembers < ActiveRecord::Migration
  def change
    create_table :board_members do |t|
      t.integer :user_id
      t.integer :board_id

      t.timestamps null: false
    end
  end
end
