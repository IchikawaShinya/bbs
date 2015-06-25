class Response < ActiveRecord::Base
  soft_deletable dependent_associations: [:thread_boards]
  belongs_to :thread_boards
  validates :comment, presence: { message: "が入力されていません。" }
  
  default_scope -> { order("responses.response_num ASC") }
end
