class DeleteIndexOrderNumToCategories < ActiveRecord::Migration
  def change
    remove_index :categories, [:order_num]
  end
end
