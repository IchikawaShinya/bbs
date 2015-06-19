class ChangeColmunDeletePassToThreadBoards < ActiveRecord::Migration
  def change
    change_column :thread_boards, :delete_pass, :string
  end
end
