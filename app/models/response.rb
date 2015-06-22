class Response < ActiveRecord::Base
  validates :comment, presence: { message: "が入力されていません。" }
  
  default_scope -> { order("responses.response_num ASC") }
end
