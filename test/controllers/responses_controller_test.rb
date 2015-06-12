require './test/test_helper.rb'

class ResponsesControllerTest < ActionController::TestCase
  # setup do
    # @response = responses(:new)
  # end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:responses)
  end

  test "should get new" do
    # get :new
#    it "コメント登録" do
      @respons = Response.new(response_num: 2,
                              thread_id: 1,
                              user_name: "user2",
                              user_email: "test@test.com",
                              user_ipaddress: "192.168.0.2",
                              comment: "テスト",
                              delete_flg: false)
      @respons.new.should be_true
      Proc.new { @respons.save }.should change(Responses, :count).by(1)
      assert_response :success
    # end
#     
    # it "投稿後画面に遷移する" do
      # post :new, username: attributes_for(:user)
      # expect(response).to redirect_to users_path
    # end
    
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
