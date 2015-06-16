class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
    @response = Response.new
    @thread_id = params[:id]
    @responses = Response.where("thread_id = ?", @thread_id)
    
    @response_num = @responses.last.response_num + 1
  end

  # GET /responses/new
  def new
    @response = Response.new
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  # POST /responses.json
  def create
    # binding.pry debug用コマンド
    @response = Response.new(response_params)
    
    begin
      Response.transaction do
        respond_to do |format|
          url = "/responses/" + params[:response][:thread_id]
          if @response.save!
            format.html { redirect_to url, notice: '投稿に成功しました。' }
            format.json { render :show, status: :created, location: @response[:thread_id] }
          else
            format.html { redirect_to url, notice: '投稿に失敗しました。' }
            format.json { render json: @response.errors, status: :unprocessable_entity }
          end
        end
      end
    rescue => ex
      return redirect_to "/responses/" + params[:response][:thread_id], notice: ex.message
    end
  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url, notice: 'Response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      # params[:response]
      params.require(:response).permit(:response_num, :thread_id, :user_name, :user_email, :user_ipaddress, :comment)
    end
end