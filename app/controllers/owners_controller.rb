class OwnersController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @owner = Owner.new
  end

  def create
    @user = User.find(params[:user_id])
    @owner = Owner.new(owner_params)
    @owner.save

    redirect_to root_path
    # redirect_to edit_user_owner_path(@user, @owner)
  end

  def edit
    @user = User.find(params[:user_id])
    @owner = Owner.find(params[:id])
  end

  private
    def owner_params
      params.require(:owner).permit(:first_name, :last_name, :mobile_phone, :avatar, :user_id )
    end


end
