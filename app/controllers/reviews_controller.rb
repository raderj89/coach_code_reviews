class ReviewsController < ApplicationController
  respond_to :js

  before_action :set_review, only: [:update, :destroy]

  def index
    @review = Review.new
    @reviews = Review.paginate(page: params[:page])
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash.now[:success] = "Request submitted successfully."
    else
      flash.now[:error] = "There was a problem submitting your request."
    end

    respond_with(@review)
  end

  def update
    if @review.update(review_params)
      flash.now[:success] = "Review updated."
    else
      flash.now[:error] = "There was a problem updating this review."
    end

    respond_with(@review)
  end

  def destroy
    if @review.destroy
      flash.now[:warning] = "Review destroyed."
    else
      flash.now[:error] = "There was a problem destroying review."
    end

    respond_with(@review)
  end

  private

    def set_review
      @review = Review.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, notice: "No review with that ID"
    end

    def review_params
      params.require(:review).permit(:pull_request_url, :coach, :active, :finished)
    end

end
