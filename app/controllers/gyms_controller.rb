class GymsController < ApplicationController
  def index
    p request.location
    if request.location.latitude == 0.0
      @latitude = 37.774929
      @longitude = -122.419416
    else
      @latitude = request.location.latitude
      @longitude = request.location.longitude 
      
    end 

    if params[:search_name].present? && params[:search_city].present?
      @welcome = "Search results by name and city"
      @gyms = Gym.search(params[:search_name]).near(params[:search_city]) 
    elsif params[:search_city].present?
      @welcome = "Gyms near #{params[:search_city]}"
      @gyms = Gym.near(params[:search_city], 50)
    elsif params[:search_name].present?
      @welcome = "Search results by name"
      @gyms = Gym.search(params[:search_name])
    else
      @welcome = "Locations close to you"
      @gyms = Gym.near([@latitude, @longitude], 20)
    end


  end

  def new
  end

  def create
  end

  def show
    @no_reviews = "There are no reviews yet, sign up to write one!"
    @user = current_user
    @gym = Gym.find(params[:id])
    @reviews = @gym.reviews
    @review = Review.new 
    #maps
    @gyms = Gym.all
    @hash = Gmaps4rails.build_markers(@gyms) do |gym, marker|
    marker.lat gym.lat
    marker.lng gym.long
end
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
