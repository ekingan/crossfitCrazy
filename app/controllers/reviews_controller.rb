class ReviewsController < ApplicationController

	def create
		@review = Review.new(review_params)
			if @review.save
        @gym = Gym.find(@review.gym_id)
        if @gym
          @gym.all_total_ratings
        else 
          puts "no gym found"
        end
				redirect_to :back
			end
	end

	def new
		@user = current_user
		@review = Review.new	
	end

	def edit
    @user = current_user
    @review = Review.find(params[:id])
     if current_user
      if @review.save
      end
      end
  end

  def update
    @review = Review.find(params[:id])
    @gym = Gym.find(@review.gym_id)
    @user = current_user
    if current_user
      @review.update_attributes(review_params)
      @gym.all_total_ratings
      redirect_to @review.gym 
    else
    end
  end

  def destroy
    # find current user
    @user = current_user
    # find post to delete
    @review = Review.find(params[:id])
    gym = Gym.find(@review.gym_id)
    gym.all_total_ratings
    # destroy post
    @gym = @review.gym
    @review.destroy
    redirect_to @gym
  end

	private
	
	def review_params
		params.require(:review).permit(:gym_id, :user_id, :body, :programming, :community, :value, :schedule, :facility, :trainers, :weightlifting_focus, :metcon_focus)
	end

end
