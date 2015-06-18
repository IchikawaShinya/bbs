class CreateThreadBoards < ActiveRecord::Migration
  def change
    create_table :thread_boards do |t|
      t.integer :category_id, null:false
      t.string :thread_name, null:false
      t.string :user_ipaddress 
      t.integer :delete_pass, null:false
      t.boolean :delete_flg, null:false, default:false
      t.timestamps null: false
    end
  end
end
