class ThreadBoard < ActiveRecord::Base
  has_many :responses, dependent: :destroy
  
  validates :category_id, presence: { message: "が選択されていません。" }
  validates :thread_name, presence: { message: "が入力されていません。" }
  validates :delete_pass, presence: { message: "が入力されていません。" }
  
  default_scope -> { order("id ASC") }
end
