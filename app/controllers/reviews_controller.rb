class ReviewsController < ApplicationController
  def create 
    product = Product.find(params[:product_id])
    review = product.reviews.new(review_params)
    review.user = current_user
    if review.save
      redirect_to product, notice: 'Review created!'
    else
      redirect_to product, notice: 'couldn\'t save.'
    end
  end

  private
  
  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
