class Response < ActiveRecord::Base
  soft_deletable dependent_associations: [:thread_boards]
  soft_deletable :column => :deleted_at
  
  belongs_to :thread_board
  validates :comment, presence: { message: t("attributes.not_input") }
  
  default_scope -> { order("responses.response_num ASC") }
  
  # 全件取得
  def self.getResponses (thread_board_id)
    @responses = Response.joins(:thread_board).select('"responses".*, "thread_boards"."category_id"').where("thread_board_id = ?", thread_board_id)
    
    return @responses
  end
  
  # 指定件数取得
  def self.getLimitResponses (thread_board_id, limit_count)
      # 件数取得
      @responses = Response.joins(:thread_board).select('"responses".*, "thread_boards"."category_id"').where("thread_board_id = ?", thread_board_id).reorder("responses.response_num DESC").limit(limit_count)
      
      unless @responses.blank?
        # 投稿順に並び替え
        @responses = @responses.sort
      end
      
      return @responses
  end
end
