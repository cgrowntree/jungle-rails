class ReviewsController < ApplicationController
  def create
    @product_id = params.require(:product_id)
    @review = Review.new(review_params)
    @review.product_id = @product_id
    @review.user_id = current_user.id
    if @review.save
      redirect_to '/products/'+@product_id
    else
      redirect_to '/products/'+@product_id, flash: { error: @review.errors.full_messages.first }
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :description)
  end

end