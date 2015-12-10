class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to root_path, flash: { success: "Successfully signed up!" }
  	else
  		# show errors
      @users_error = flash[:error] = @user.errors.full_messages.join(', ')
      #if not saved return to new post form
      render :new
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
