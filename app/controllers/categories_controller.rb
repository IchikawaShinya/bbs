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
      Categories.transaction do
        respond_to do |format|
          if @category.save!
            format.html { redirect_to @category, notice: 'Category was successfully created.' }
            format.json { render :show, status: :created, location: @category }
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
    @categories = Array.new
    params["category"].each do|c|
      category = Category.without_soft_destroyed.find(c[1]["id"].to_i)
      category["category_name"] = c[1]["category_name"]
      category["order"] = c[1]["order"].to_i
      @categories.push(category)
    end
    
    begin
      Categories.transaction do
        @categories.each do |category|
          @category = Category.without_soft_destroyed.find(category[:id])
          respond_to do |format|
            # if @category.update(category_name)
            if @category.update(:category_name => category_name[:category_name],:order => category_name[:order].to_i)
              format.html { render :edit, notice: 'Category was successfully updated.' }
              format.json { render :edit, status: :ok, location: @category }
            else
              format.html { render :edit, notice: '更新に失敗しました。' }
              format.json { render json: category.errors, status: :unprocessable_entity }
            end
          end
        end
      end
    rescue => ex
      ActiveRecord::Rollback
      return render :edit, notice: ex.message
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    begin
      @category.soft_destroy!
      respond_to do |format|
        format.html { redirect_to categories_url+"/edit", notice: 'Category was successfully destroyed.' }
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
      params.require(:category).permit(:category_name, :order)
    end
end
