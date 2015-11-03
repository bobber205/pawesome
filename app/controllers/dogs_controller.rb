class DogsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @dogs = @user.dogs
  end

  def new
    @user = User.find(params[:user_id])
    @dog = @user.dogs.new
  end

  def edit
    @user = User.find(params[:user_id])
    @dog = @user.dogs.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @dog = @user.dogs.new(dog_params)

    @dog.save
    redirect_to user_dogs_path(@user, @dog)

  end



  def update
    @user = User.find(params[:user_id])
    @dog = @user.dogs.find(params[:id])
    @dog.update(dog_params)
    redirect_to user_dog_path(@user)

  end

  def destroy
    @user = User.find(params[:user_id])
    @dog = @user.dogs.find(params[:id])
    @dog.destroy
    redirect_to  user_dogs_path(@user)

  end


  private
    def dog_params
      params.require(:dog).permit(:name, :age, :gender, :breed, :size, :discribtion, :user_id )
    end
end
