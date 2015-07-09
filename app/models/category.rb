class Category < ActiveRecord::Base
  soft_deletable :column => :deleted_at
  # has_many :responses, dependent: :destroy
  validates :category_name, presence: { message: "が入力されていません。" }
  validates :order_num, presence: { message: "が入力されていません。" }
  
  default_scope -> { order("categories.id ASC") }
  
  def self.overlap_order_num(categories)
    validateFlg = true
    categories.each_with_index do |cate,index|
      if (index+1) < categories.length
        if (cate[:order_num] == categories[index+1][:order_num])
          validateFlg = false
        end
      end
    end
    
    return validateFlg
  end
  
end