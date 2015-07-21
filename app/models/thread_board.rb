class ThreadBoard < ActiveRecord::Base
  soft_deletable :column => :deleted_at
  has_many :responses, dependent: :destroy
  paginates_per 5  # 1ページあたり表示数
  
  validates :category_id, presence: { message: t("attributes.not_select") }
  validates :thread_name, presence: { message: t("attributes.not_input") }
  validates :delete_pass, presence: { message: t("attributes.not_input") }
  
  default_scope -> { order("thread_boards.id ASC") }
end
