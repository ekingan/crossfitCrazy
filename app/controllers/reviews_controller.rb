class ReviewsController < ApplicationController

	def create
		@review = Review.new(review_params)
			if @review.save
				redirect_to :back
			end
	end

	def new
		@user = current_user
		@review = Review.new	
	end

	def edit
    @review = Review.find(params[:id])
     if current_user
      if @review.save
      end
      end
  end

  def update
  	@gym = Gym.find(params[:id])
    @review = Review.find(params[:id])
    @reviews = @gym.reviews
    @user = current_user
    if current_user
      @review.update_attributes(review_params)
      redirect_to(:back) 
    else
    end
  end

  def destroy
    # find current user
    @user = current_user
    @gym = Gym.find(params[:id])
    # find post to delete
    review = Review.find(params[:id])
    # destroy post
    review.destroy
    redirect_to @gym
  end

	private
	
	def review_params
		params.require(:review).permit(:gym_id, :user_id, :body)
	end

end
