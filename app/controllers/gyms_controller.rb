class GymsController < ApplicationController
  def index
    if params[:search_name]
      @gyms = Gym.search(params[:search_name]) 
    else
      @city = request.location.try(:city)
      p @city
      @gyms = Gym.all
      # @gyms = Gym.near(@city)
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
