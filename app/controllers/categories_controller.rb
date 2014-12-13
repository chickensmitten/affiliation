class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update]  

  def show
    @category = Category.find(params[:id]) #TODO: Implement Pagination.
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Your category was created."
      redirect_to posts_path
    else
      render :new
    end    
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "This category was updated."
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy

  end  

  private

  def category_params
    params.require(:category).permit( :name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end