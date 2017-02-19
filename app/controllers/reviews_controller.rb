class ReviewsController < ApplicationController
  before_filter :authorize, :only => :delete

  def create
    review = Review.new(
      product_id: params[:product_id],
      user: current_user,
      description: params[:review][:description],
      rating: params[:star])

    if review.save
      redirect_to product_path(params[:product_id])
    else
      redirect_to product_path(params[:product_id])
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(params[:product_id])

  end

end
