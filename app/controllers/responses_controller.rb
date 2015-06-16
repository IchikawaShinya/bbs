class ResponsesController < ApplicationController
  before_action :set_response, only: [:edit, :update, :destroy]
  protect_from_forgery except: [:new]

  def index
    thread_id = 1
    @responses = Response.where("thread_id = ?", thread_id)
    
    if @responses.length > 0
      @response_num = @responses.length + 1
    end
    
  end
  
  def new
    @response = Response.new(params[:response])
    
    @response.attributes = {response_num: params[:response_num],
                            thread_id: params[:thread_id],
                            user_name: params[:user_name],
                            user_email: params[:user_email],
                            user_ipaddress: params[:user_ipaddress],
                            comment: params[:comment]}
    if @response.save
      flash[:notice] = "投稿しました。"
      # redirect_to :action => 'index'
    end
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(response_params)

    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: 'Response was successfully created.' }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
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
      params[:response]
    end
end
