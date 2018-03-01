class Admin::CategoriesController < ApplicationController

  def new
    @category = Category.new
    @categories = Category.order(id: :desc).all
  end

  def create
    @category = Category.new(category_params)
  
    if @category.save
      redirect_to [:new, :admin, :product], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
