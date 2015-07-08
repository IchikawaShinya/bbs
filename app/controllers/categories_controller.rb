class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.without_soft_destroyed.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @thread_boards = ThreadBoard.without_soft_destroyed.where("category_id = ?", params[:id])
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    @categories = Category.without_soft_destroyed.all
    @category = Category.new
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    begin
      Category.transaction do
        respond_to do |format|
          if @category.save!
            format.html { redirect_to @category, notice: 'Category was successfully created.' }
            format.json { render :index, status: :created, location: @category }
          else
            format.html { render :new, notice: '更新に失敗しました。' }
            format.json { render json: @category.errors, status: :unprocessable_entity }
          end
        end
      end
    rescue => ex
      ActiveRecord::Rollback
      return render :new, notice: ex.message
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    # @categories = params["category"]
    url = request.env["HTTP_REFERER"]
    # @categories = params["category"]
    @categories = Array.new
    unless params["category"].blank?
      params["category"].each_with_index do|cate,index|
          @categories[index] = cate[1]
      end
    end
    
    @updateFlg = Category.overlap_order_num(@categories)
    
    if @updateFlg
      begin
        Category.transaction do
          @categories.each do |cate|
            @category = Category.without_soft_destroyed.find_by_id(cate[:id])
              unless @category.update(:id => cate[:id].to_i,
                                  :category_name => cate[:category_name],
                                  :order_num => cate[:order_num].to_i)
                @updateFlg = false
            end
          end
        end
      rescue => ex
        binding.pry
        ActiveRecord::Rollback
        return redirect_to url, notice: ex.message
      end
      
      respond_to do |format|
        if @updateFlg
          format.html { redirect_to url, notice: '更新に成功しました。' }
          format.json { render :edit, status: :ok, location: @category }
        else
          format.html { redirect_to url, notice: '更新に失敗しました。' }
          format.json { render json: category.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
          format.html { redirect_to url, notice: '同じ順番は設定できません。' }
          format.json { render json: category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    begin
      @category.soft_destroy!
      respond_to do |format|
        format.html { redirect_to categories_url+"/edit", notice: '削除に成功しました。' }
        format.json { head :no_content }
      end
    rescue => ex
      ActiveRecord::Rollback
      return redirect_to categories_url+"/edit", notice: ex.message
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.without_soft_destroyed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      # params[:category]
      params.require(:category).permit(:category_name, :order_num)
    end
end
