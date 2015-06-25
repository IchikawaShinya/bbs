class AddDeletedAtToThreadBoards < ActiveRecord::Migration
  def change
    add_column :thread_boards, :deleted_at, :datetime
  end
end
