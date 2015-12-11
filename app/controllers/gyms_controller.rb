class GymsController < ApplicationController
  def index
    p request.location.latitude
    if request.location.latitude == 0.0
      latitude = 37.774929
      longitude = -122.419416
    else
      latitude = request.location.latitude
      longitude = request.location.longitude 
    end 

    if params[:search_name]
      @gyms = Gym.search(params[:search_name]) 
    elsif params[:search_city]
      @gyms = Gym.near(params[:search_city], 50)
    else
      @gyms = Gym.near([latitude, longitude], 50)
      p @gyms
      p request.location
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
      @user = current_user
      @gym = Gym.find(params[:id])
      if current_user
        if @gym.save
        end
      end
  end

  def update
    @review = Review.new
    @user = current_user
    @gym = Gym.find(params[:id])
    if current_user
      @gym.update_attributes(gym_params)
      @reviews = @gym.reviews
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
