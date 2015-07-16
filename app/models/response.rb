class Response < ActiveRecord::Base
  soft_deletable dependent_associations: [:thread_boards]
  soft_deletable :column => :deleted_at
  
  belongs_to :thread_board
  validates :comment, presence: { message: "が入力されていません。" }
  
  default_scope -> { order("responses.response_num ASC") }
  
  def self.getResponses (thread_board_id)
    @responses = Response.joins(:thread_board).select('"responses".*, "thread_boards"."category_id"').where("thread_board_id = ?", thread_board_id)
    
    return @responses
  end
  
  def self.getLimitResponses (thread_board_id, limit_count)
      # 件数取得
      @responses = Response.joins(:thread_board).select('"responses".*, "thread_boards"."category_id"').where("thread_board_id = ?", thread_board_id).reorder("responses.response_num DESC").limit(limit_count)
      
      binding.pry
      
      unless @responses.blank?
        # 投稿順に並び替え
        @responses = @responses.sort
      end
      
      return @responses
  end
  
  
end
