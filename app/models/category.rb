class Category < ActiveRecord::Base
  soft_deletable :column => :deleted_at
  # has_many :responses, dependent: :destroy
  validates :order, presence: { message: "が選択されていません。" }
  
  
  default_scope -> { order("categories.order ASC") }
end
