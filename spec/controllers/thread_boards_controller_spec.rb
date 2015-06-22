require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ThreadBoardsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ThreadBoard. As you add validations to ThreadBoard, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      "category_id" => "1",
      "thread_name" => "新規スレッド",
      "user_ipaddress" => "192.168.0.1",
      "delete_pass" => "0000",
    }
    # skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    {
      "category_id" => "",
      "thread_name" => "",
      "user_ipaddress" => "",
      "delete_pass" => "",
    }
    # skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ThreadBoardsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    # it "assigns all thread_boards as @thread_boards" do
      # thread_board = ThreadBoard.create! valid_attributes
      # get :index, {}, valid_session
      # expect(assigns(:thread_boards)).to eq([thread_board])
    # end
    it '初期表示' do
      assert_response :success
    end
  end

  # describe "GET #show" do
    # it "assigns the requested thread_board as @thread_board" do
      # thread_board = ThreadBoard.create! valid_attributes
      # get :show, {:id => thread_board.to_param}, valid_session
      # expect(assigns(:thread_board)).to eq(thread_board)
    # end
  # end
# 
  # describe "GET #new" do
    # it "assigns a new thread_board as @thread_board" do
      # get :new, {}, valid_session
      # expect(assigns(:thread_board)).to be_a_new(ThreadBoard)
    # end
  # end
# 
  # describe "GET #edit" do
    # it "assigns the requested thread_board as @thread_board" do
      # thread_board = ThreadBoard.create! valid_attributes
      # get :edit, {:id => thread_board.to_param}, valid_session
      # expect(assigns(:thread_board)).to eq(thread_board)
    # end
  # end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ThreadBoard" do
        expect {
          post :create, {:thread_board => valid_attributes}, valid_session
        }.to change(ThreadBoard, :count).by(1)
      end

      it "assigns a newly created thread_board as @thread_board" do
        post :create, {:thread_board => valid_attributes}, valid_session
        expect(assigns(:thread_board)).to be_a(ThreadBoard)
        expect(assigns(:thread_board)).to be_persisted
      end

      it "redirects to the created thread_board" do
        post :create, {:thread_board => valid_attributes}, valid_session
        expect(response).to redirect_to(thread_boards_url)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved thread_board as @thread_board" do
        post :create, {:thread_board => invalid_attributes}, valid_session
        expect(assigns(:thread_board)).to be_a_new(ThreadBoard)
      end

      it "re-renders the 'new' template" do
        post :create, {:thread_board => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end
# 
  # describe "PUT #update" do
    # context "with valid params" do
      # let(:new_attributes) {
        # skip("Add a hash of attributes valid for your model")
      # }
# 
      # it "updates the requested thread_board" do
        # thread_board = ThreadBoard.create! valid_attributes
        # put :update, {:id => thread_board.to_param, :thread_board => new_attributes}, valid_session
        # thread_board.reload
        # skip("Add assertions for updated state")
      # end
# 
      # it "assigns the requested thread_board as @thread_board" do
        # thread_board = ThreadBoard.create! valid_attributes
        # put :update, {:id => thread_board.to_param, :thread_board => valid_attributes}, valid_session
        # expect(assigns(:thread_board)).to eq(thread_board)
      # end
# 
      # it "redirects to the thread_board" do
        # thread_board = ThreadBoard.create! valid_attributes
        # put :update, {:id => thread_board.to_param, :thread_board => valid_attributes}, valid_session
        # expect(response).to redirect_to(thread_board)
      # end
    # end
# 
    # context "with invalid params" do
      # it "assigns the thread_board as @thread_board" do
        # thread_board = ThreadBoard.create! valid_attributes
        # put :update, {:id => thread_board.to_param, :thread_board => invalid_attributes}, valid_session
        # expect(assigns(:thread_board)).to eq(thread_board)
      # end
# 
      # it "re-renders the 'edit' template" do
        # thread_board = ThreadBoard.create! valid_attributes
        # put :update, {:id => thread_board.to_param, :thread_board => invalid_attributes}, valid_session
        # expect(response).to render_template("edit")
      # end
    # end
  # end
# 
  # describe "DELETE #destroy" do
    # it "destroys the requested thread_board" do
      # thread_board = ThreadBoard.create! valid_attributes
      # expect {
        # delete :destroy, {:id => thread_board.to_param}, valid_session
      # }.to change(ThreadBoard, :count).by(-1)
    # end
# 
    # it "redirects to the thread_boards list" do
      # thread_board = ThreadBoard.create! valid_attributes
      # delete :destroy, {:id => thread_board.to_param}, valid_session
      # expect(response).to redirect_to(thread_boards_url)
    # end
  # end

end
