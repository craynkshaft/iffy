class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
	@user = User.new(params.require(:user).permit(:name, :email, :password, :address, :zip, :radius, :bio, :latitude, :longitude, :traveling, :mood_ids => [], :places =>[] ))
	if @user.save	
		log_in(@user)
		flash[:error] = 'Welcome to Iffy! Choose a mood below to get started'
		redirect_to root_path
	else
		flash[:error] = 'Please complete all fields to create an account'
		render 'new'
	end
  end


  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
	 @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
		if @user.update_attributes(params.require(:user).permit(:name, :email, :places, :access, :radius, :address, :zip, :bio, :latitude, :longitude, :traveling, :mood_ids => [], :places =>[] ))
			current_user.saveLat current_user.zip.to_s.to_lat.to_f
      current_user.saveLon current_user.zip.to_s.to_lon.to_f
      redirect_to user_path
		else
			render 'edit'
		end
  end

  def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
  end
end