class GymsController < ApplicationController
  def index
    user_location = request.remote_ip
    p user_location
    if params[:search_name]
      @gyms = Gym.search(params[:search_name]) 
    elsif params[:search_city]
      @gyms = Gym.near(params[:search_city], 50)
    else
      @gyms = Gym.near(user_location)
    end
  end

  def new
  end

  def create
  end

  def show
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
