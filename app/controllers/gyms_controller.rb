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
      @welcome = "Search results by name"
      @gyms = Gym.search(params[:search_name]) 
    elsif params[:search_city]
      @welcome = "Search results by city"
      @gyms = Gym.near(params[:search_city], 50)
    else
      @welcome = "Locations closest to you"
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
    
    if @review.programming.blank?
      @avg_prog_review = 0
    else 
      @avg_prog_review = @reviews.programming.average(:programming).round(2)
    end

    weightlifting = Review.count(:conditions => {:weightlifting => "true"})
    p weightlifting
    metcon =  Review.count(:conditions => {:metcon => "true"})
    p metcon
    if weightlifting > metcon
      @focus = "This gym focuses on weightlifting"
    elsif metcon < weightlifting
      @focus = "This gym focuses on metcon training"
    else 
      @focus = "This gym offers a balance of weightlifting and metcon training"
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
