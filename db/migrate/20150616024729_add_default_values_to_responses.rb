class AddDefaultValuesToResponses < ActiveRecord::Migration
  def change
    change_column_default :responses, :user_name, '名無しさん'
  end
end
