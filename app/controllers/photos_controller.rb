class PhotosController < ApplicationController
  def destroy
    @user = User.find(params[:user_id])
    @user.listing.photos.find(params[:id]).destroy
    redirect_to edit_user_listing_path(@user, @user.listing)
  end
end
