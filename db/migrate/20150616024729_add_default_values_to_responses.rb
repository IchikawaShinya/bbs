class AddDefaultValuesToResponses < ActiveRecord::Migration
  def change
    change_column :responses, :user_name, :default => "名無しさん"
  end
end
