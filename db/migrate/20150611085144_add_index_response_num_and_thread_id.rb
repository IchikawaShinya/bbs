class AddIndexResponseNumAndThreadId < ActiveRecord::Migration
  def change
    add_index :responses, [:response_num, :thread_id], :unique => true
  end
end
