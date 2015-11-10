class ListingsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @listing = Listing.new
    @profile = @user.profile
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
    @listing = @user.listing
  end

  def create
    @user = User.find(params[:user_id])
    @listing = Listing.new(listing_params)
    @user.listing = @listing
    if @listing.save
      redirect_to edit_user_listing_path(@user,@listing)
    else render 'new'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    respond_to do |format|
      format.html {redirect_to edit_user_listing_path(@user, @listing)}
      format.js
    end
  end

  private
    def listing_params
      params.require(:listing).permit(:address, :title, :describtion, :property_type, :dog_type, :listing_photo)

    end
end
