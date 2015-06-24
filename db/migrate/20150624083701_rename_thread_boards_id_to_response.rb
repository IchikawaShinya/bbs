class RenameThreadBoardsIdToResponse < ActiveRecord::Migration
  def change
    rename_column :responses, :thread_boards_id, :thread_board_id
  end
end
