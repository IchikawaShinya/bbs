class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_name, null:false
      t.integer :order, null:false, :unique => true

      t.timestamps null: false
    end
    
    add_index :categories, [:order], :unique => true
  end
end
