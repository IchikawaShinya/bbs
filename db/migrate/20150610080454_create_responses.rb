class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :response_num, null:false
      t.integer :thread_id, null:false
      t.string :user_name
      t.string :user_email
      t.string :user_ipaddress
      t.text :comment, null:false
      t.boolean :delete_flg, null:false, default:false
      t.timestamps null: false
    end
  end
end
