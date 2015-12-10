class GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end

  def new
  end

  def create
  end

  def show
    @user = current_user
    @gym = Gym.find(params[:id])
    @review = @gym.reviews.new(params[:review])
    @reviews = @gym.reviews
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
