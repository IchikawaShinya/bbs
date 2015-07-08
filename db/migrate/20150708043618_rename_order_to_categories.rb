class RenameOrderToCategories < ActiveRecord::Migration
  def change
    rename_column :categories, :order, :order_num
  end
end
