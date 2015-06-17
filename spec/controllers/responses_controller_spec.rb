require 'rails_helper'

RSpec.describe ResponsesController, :type => :controller do

  describe 'index' do
    it '初期表示' do
      assert_response :success
    end
  end
  
  describe 'show' do
    it '一覧表示' do
      get :show, {:id=>1}
      assert_response :success
      expect(assigns(:thread_id)).to eq "1"
      expect(assigns(:response_num)).to eq 1
      expect(assigns(@responses)).blank?
    end
  end
  
  describe 'create' do
    it 'コメント投稿' do
      response = {"response" => {"response_num"=>"1",
                     "thread_id"=>"1",
                     "user_name"=>"user2",
                     "user_email"=>"test@test.com",
                     "user_ipaddress"=>"192.168.0.2",
                     "comment"=>"投稿テスト"}}
      post :create, response
      @res = Response.where("thread_id = 1")
      expect(@res.length).to eq 1
      
      assert_response :redirect
    end
  end

end
