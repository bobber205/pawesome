class DogsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @dog = @user.dogs.new
  end

  def create
    @user = User.find(params[:user_id])
    @dog = @user.dogs.new(dog_params)

    @dog.save
    redirect_to user_path(@user)

  end

  private
    def dog_params
      params.require(:dog).permit(:name, :age, :gender, :breed, :size, :discribtion, :user_id )
    end
end
