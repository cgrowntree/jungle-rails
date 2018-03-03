class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
    @reviews = @product.reviews.order(created_at: :desc)
  end

  def create
    @review = Product.reviews.new(review_params)
    if @review.save
      redirect_to '/products'
    else
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
