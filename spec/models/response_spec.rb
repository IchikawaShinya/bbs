require 'rails_helper'

RSpec.describe Response, :type => :model do
  
  describe 'response' do 
    #  スレッドID
    thread_board_id = 1
    #  投稿件数
    response_count = 5
    #  表示件数
    limit_count = 3
    
    before do
      response_count.times do |i|
        response = Response.new(
        "response_num"=> i,
        "thread_board_id"=> "1",
        "user_name"=> "user1",
        "user_email"=> "test@test.com",
        "user_ipaddress"=> "192.168.0.1",
        "comment"=> "投稿テスト"+i.to_s)
        response.save
      end
    end
    
    # 全件取得
    it 'getResponses' do
      @responses = Response.getResponses(thread_board_id)
      expect(@responses.length).to eq response_count
    end
    
    # 指定数取得
    it 'getLimitResponses' do
      @responses = Response.getLimitResponses(thread_board_id,limit_count)
      expect(@responses.length).to eq limit_count
    end
  end
end
