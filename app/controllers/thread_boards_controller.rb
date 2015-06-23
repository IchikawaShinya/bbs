class ThreadBoardsController < ApplicationController
  before_action :set_thread_board, only: [:show,:edit, :update, :destroy]

  # GET /thread_boards
  # GET /thread_boards.json
  def index
    @thread_boards = ThreadBoard.all
    # @thread_boards = ThreadBoard.all.reorder(:category_id,:id)
    
    @thread_board = ThreadBoard.new
  end

  # GET /thread_boards/1
  # GET /thread_boards/1.json
  def show
  end

  # GET /thread_boards/new
  def new
    @thread_board = ThreadBoard.new
  end

  # GET /thread_boards/1/edit
  def edit
  end

  # POST /thread_boards
  # POST /thread_boards.json
  def create
    @thread_board = ThreadBoard.new(thread_board_params)

    begin
      ThreadBoard.transaction do
        respond_to do |format|
          if @thread_board.save!
            format.html { redirect_to thread_boards_url, notice: 'スレッドの作成に成功しました。' }
            format.json { render :index, status: :created, location: @thread_board }
          else
            format.html { render :new, notice: 'スレッドの作成に失敗しました。'  }
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
      # binding.pry
      if @thread_board.update(thread_board_params)
        format.html { redirect_to @thread_board, notice: 'Thread board was successfully updated.' }
        format.json { render :show, status: :ok, location: @thread_board }
      else
        format.html { render :edit }
        format.json { render json: @thread_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thread_boards/1
  # DELETE /thread_boards/1.json
  def destroy
    
    @thread_board.destroy
    respond_to do |format|
      format.html { redirect_to thread_boards_url, notice: 'Thread board was successfully destroyed.' }
      format.json { head :no_content }
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thread_board
      @thread_board = ThreadBoard.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thread_board_params
      # params[:thread_board]
      params.require(:thread_board).permit(:category_id, :thread_name, :thread_id, :user_ipaddress, :delete_pass)
    end
end
