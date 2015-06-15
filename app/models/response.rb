class Response < ActiveRecord::Base
  validates :comment, presence: true
  
  default_scope -> { order("response_num ASC") }
end
