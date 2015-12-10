class GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end

  def new
  end

  def create
  end

  def show
    # @lat = request.location.latitude
    # @long = request.location.longitude
    @user = current_user
    @gym = Gym.find(params[:id])
    @reviews = @gym.reviews
    @review = Review.new
  end

  def edit
      @gym = Gym.find(params[:id])
      if current_user
        if @gym.save
        end
      end
  end

  def update
    @gym = Gym.find(params[:id])
    if current_user
      @gym.update_attributes(gym_params)
      render :show
    else
    end
  end

  def destroy
  end

  private

  def gym_params
    params.require(:gym).permit(:name, :website, :address, :phone)
  end
end
