class OwnersController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @owner = Owner.new
  end

  def create
    @user = User.find(params[:user_id])
    @owner = Owner.new(owner_params)
    @owner.save

    redirect_to profile_path
  end

  private
    def owner_params
      params.require(:owner).permit(:first_name, :last_name, :mobile_phone, :avatar, :user_id )
    end


end
