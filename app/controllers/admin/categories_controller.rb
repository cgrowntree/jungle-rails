class Admin::CategoriesController < ApplicationController
  before_filter :authenticate
  
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

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username = ENV['ADMIN_USER'] && password = ENV['ADMIN_PASS']
    end
  end

end
