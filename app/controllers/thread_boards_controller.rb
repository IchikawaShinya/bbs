class ThreadBoardsController < ApplicationController
  before_action :set_thread_board, only: [:show, :edit, :update, :destroy]
  after_action :soft_destroy_with_children, only: [:destroy]
  before_action :check_pass, only: [:edit, :destroy]

  # GET /thread_boards
  # GET /thread_boards.json
  def index
    @thread_boards = ThreadBoard.without_soft_destroyed.all.page(params[:page])
    # @thread_boards = ThreadBoard.all.reorder(:category_id,:id)
    
    @thread_board = ThreadBoard.new
  end

  # GET /thread_boards/1
  # GET /thread_boards/1.json
  def show
    @thread_board_id = params[:id]
    
    # 投稿コメント取得
    @responses = Response.getLimitResponses(@thread_board_id, @limit_count = 15)
    
  end

  # GET /thread_boards/new
  def new
    @thread_board = ThreadBoard.new
  end

  # GET /thread_boards/1/edit
  def edit
    unless @pass_flg
      redirect_to @thread_board, notice: t("attributes.mistaken_password")
    end
  end

  # POST /thread_boards
  # POST /thread_boards.json
  def create
    @thread_board = ThreadBoard.new(thread_board_params)

    begin
      ThreadBoard.transaction do
        respond_to do |format|
          if @thread_board.save!
            format.html { redirect_to thread_boards_url, notice: t("attributes.created_success") }
            format.json { render :index, status: :created, location: @thread_board }
          else
            format.html { render :new, notice: t("attributes.created_failed") }
            format.json { render json: @thread_board.errors, status: :unprocessable_entity }
          end
        end
      end
    rescue => ex
      ActiveRecord::Rollback
      return render :new, notice: ex.message
    end
  end

  # PATCH/PUT /thread_boards/1
  # PATCH/PUT /thread_boards/1.json
  def update
    respond_to do |format|
      if @thread_board.update(thread_board_params)
        format.html { redirect_to @thread_board, notice: t("attributes.update_success") }
        format.json { render :show, status: :ok, location: @thread_board }
      else
        format.html { render :edit, notice: t("attributes.update_failed")  }
        format.json { render json: @thread_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thread_boards/1
  # DELETE /thread_boards/1.json
  def destroy
    if @pass_flg
      begin
        ThreadBoard.transaction do
          # @thread_board.destroy
          @thread_board.soft_destroy!
          # @thread_board.responses.soft_destroy!
          # Response.soft_destroyed
          respond_to do |format|
            format.html { redirect_to thread_boards_url, notice: t("attributes.delete_success") }
            format.json { head :no_content }
          end
        end
      rescue => ex
        ActiveRecord::Rollback
        return redirect_to thread_boards_url, notice: ex.message
      end
    else
      redirect_to @thread_board, notice: t("attributes.mistaken_password")
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thread_board
      @thread_board = ThreadBoard.without_soft_destroyed.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thread_board_params
      # params[:thread_board]
      params.require(:thread_board).permit(:category_id, :thread_name, :thread_id, :user_ipaddress, :delete_pass)
    end
    
    # 関連子テーブル削除
    def soft_destroy_with_children
      if @thread_board.soft_destroyed?
        @thread_board.responses.each do |child|
          child.soft_destroy!
        end
      end
    end
    
    # パスワードチェック
    def check_pass
      @pass_flg = false
      unless params[:confirm_pass].blank?
        if @thread_board[:delete_pass] == params[:confirm_pass]
          @pass_flg = true
        end
      end
    end
end
