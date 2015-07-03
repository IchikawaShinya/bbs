require 'rails_helper'

RSpec.describe Response, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
      thread_board_id = 1
      limit_count = 3
  
  describe 'response' do
    it 'getResponses' do
      @responses = Response.getResponses(thread_board_id)
      expect(@responses.length).to > 0
    end
    
    it 'getLimitResponses' do
      @responses = Response.getLimitResponses(thread_board_id,limit_count)
      expect(@responses.length).to eq 3
    end
  end
end
