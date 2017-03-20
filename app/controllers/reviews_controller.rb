class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.video = Video.find(params[:video_id])
    @review.user = current_user
    if @review.save
      flash[:info] = "You've created a new review"
      redirect_to :back
    else
      render 'videos/show', id:params[:review][:video_id]
    end
  end

  private
  def review_params
    params.require(:review).permit!
  end
end