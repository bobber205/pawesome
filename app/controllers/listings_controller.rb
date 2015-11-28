class ListingsController < ApplicationController
  def index  
    @listings = Listing.all
  end
  
  def show 
    @listing = Listing.find(params[:id])
  end

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
    @photos = @listing.photos
  end

  def create
    @user = User.find(params[:user_id])
    @listing = Listing.new(listing_params)
    @user.listing = @listing
    if @listing.save
      if params[:images].present?
        params[:images].each do |image|
          @listing.photos.create(:image => image)
        end
      end
      redirect_to edit_user_listing_path(@user,@listing)
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @listing = Listing.find(params[:id])
    @dog_type = params[:dog_type] || []
    if @listing.update(listing_params)
      if params[:images].present?
        params[:images].each do |image|
          @listing.photos.create(:image => image)
        end
      end
      respond_to do |format|
        format.html {redirect_to edit_user_listing_path(@user, @listing)}
        format.js
      end
    end
  end

  private
    def listing_params
      params.require(:listing).permit(:address, :title, :describtion, :property_type, dog_type:[])
    end
end
