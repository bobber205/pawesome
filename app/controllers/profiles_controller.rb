class ProfilesController < ApplicationController


  def new
    @user = User.find(params[:user_id])
    @profile = Profile.new

  end

  def create
    @user = User.find(params[:user_id])
    @profile = Profile.new(profile_params)
    if @profile.save
      @user.profile = @profile
      redirect_to edit_user_profile_path(current_user,current_user.profile)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
    @dogs = @user.dogs

  end

  def update
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    respond_to do |format|
      format.html {redirect_to edit_user_profile_path(@user, @profile)}
      format.js
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :mobile_number, :avatar)

    end

end
