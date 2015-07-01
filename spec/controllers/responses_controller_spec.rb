require 'rails_helper'

RSpec.describe ResponsesController, :type => :controller do

  let(:valid_attributes) {
    {
      "response_num"=>"1",
      "thread_board_id"=>"1",
      "user_name"=>"user2",
      "user_email"=>"test@test.com",
      "user_ipaddress"=>"192.168.0.2",
      "comment"=>"投稿テスト"
    }
    # skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    {
      "response_num"=>"1",
      "thread_board_id"=>"1",
      "user_name"=>"",
      "user_email"=>"",
      "user_ipaddress"=>"",
      "comment"=>""
    }
    # skip("Add a hash of attributes invalid for your model")
  }
  
  let(:valid_session) { {} }

  describe 'index' do
    it '初期表示' do
      assert_response :success
    end
  end
  
  describe 'show' do
    it '一覧表示' do
      get :show, {:id=>1}
      assert_response :success
      expect(assigns(:thread_board_id)).to eq "1"
      expect(assigns(:response_num)).to eq 1
      expect(assigns(@responses)).blank?
    end
  end
  
  describe 'create' do
    it 'コメント投稿' do
      response = {"response" => {"response_num"=>"1",
                     "thread_board_id"=>"1",
                     "user_name"=>"user2",
                     "user_email"=>"test@test.com",
                     "user_ipaddress"=>"192.168.0.2",
                     "comment"=>"投稿テスト"}}
      post :create, response
      @res = Response.where("thread_board_id = 1")
      expect(@res.length).to eq 1
      
      assert_response :redirect
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested thread_board" do
      response = Response.create! valid_attributes
      expect {
        delete :destroy, {:id => response.to_param}, valid_session
      }.to change(Response, :count).by(0)
    end

    it "redirects to the responses list" do
      response = Response.create! valid_attributes
      delete :destroy, {:id => response.to_param}, valid_session
      expect(response).to redirect_to(responses_url)
    end
  end

end
