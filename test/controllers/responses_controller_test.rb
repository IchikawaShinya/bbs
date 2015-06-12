require './test/test_helper.rb'
require './spec/rails_helper.rb'
require './spec/spec_helper.rb'

class ResponsesControllerTest < ActionController::TestCase
  # setup do
    # @response = responses(:new)
  # end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:responses)
  end

  test "new method" do
      post :new, {:response_num=> 2,
                    :thread_id=> 1,
                    :user_name=> "user2",
                    :user_email=> "test@test.com",
                    :user_ipaddress=> "192.168.0.2",
                    :comment=> "投稿テスト"}
      @res = Response.where("thread_id = 1").order('response_num ASC')
      @res.length.should == 2
      assert_response :success
  end
# 
  # test "should create response" do
    # assert_difference('Response.count') do
      # post :create, response: {  }
    # end
# 
    # assert_redirected_to response_path(assigns(:response))
  # end
# 
  # test "should show response" do
    # get :show, id: @response
    # assert_response :success
  # end
# 
  # test "should get edit" do
    # get :edit, id: @response
    # assert_response :success
  # end
# 
  # test "should update response" do
    # patch :update, id: @response, response: {  }
    # assert_redirected_to response_path(assigns(:response))
  # end
# 
  # test "should destroy response" do
    # assert_difference('Response.count', -1) do
      # delete :destroy, id: @response
    # end
# 
    # assert_redirected_to responses_path
  # end
end
