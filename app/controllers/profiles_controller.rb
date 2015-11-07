class ProfilesController < ApplicationController
   
  
  def new 
    @user = User.find(params[:user_id])
    @profile = Profile.new
     
  end
  
  def create
    @user = User.find(params[:user_id])
    @profile = Profile.new(profile_prarams)
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
    @profile =  Profile.find(params[:id])
    @dogs = @profile.dogs
  end
  
  private
    def profile_prarams
      params.require(:profile).permit(:first_name, :last_name, :mobile_number, :avatar)
      
    end
  
end
