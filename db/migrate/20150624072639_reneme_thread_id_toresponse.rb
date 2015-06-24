class RenemeThreadIdToresponse < ActiveRecord::Migration
  def change
    rename_column :responses, :thread_id, :thread_boards_id
  end
end
