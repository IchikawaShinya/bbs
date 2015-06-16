class Response < ActiveRecord::Base
  validates :comment, presence: { message: "コメントが入力されていません。" }
  
  default_scope -> { order("response_num ASC") }
end
