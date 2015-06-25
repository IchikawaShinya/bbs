class ThreadBoard < ActiveRecord::Base
  soft_deletable :column => :deleted_at
  has_many :responses, dependent: :destroy
  
  validates :category_id, presence: { message: "が選択されていません。" }
  validates :thread_name, presence: { message: "が入力されていません。" }
  validates :delete_pass, presence: { message: "が入力されていません。" }
  
  default_scope -> { order("thread_boards.id ASC") }
end
