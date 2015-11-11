class ListingsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @listing = Listing.new
    @listing.dog_type = []
    @profile = @user.profile
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
    @listing = @user.listing
    @dog_type = params[:dog_type] || []
  end

  def create
    @user = User.find(params[:user_id])
    @listing = Listing.new(listing_params)
    @user.listing = @listing
    if @listing.save
      params[:image].each do |picture|
        @listing.listing_photos.create(:image => picture)
      end
      redirect_to edit_user_listing_path(@user,@listing)
    else render 'new'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @listing = Listing.find(params[:id])
    @dog_type = params[:dog_type] || []
    @listing.update(listing_params)
    respond_to do |format|
      format.html {redirect_to edit_user_listing_path(@user, @listing)}
      format.js
    end
  end

  private
    def listing_params
      params.require(:listing).permit(:address, :title, :describtion, :property_type, :listing_photo, dog_type:[])

    end
end
