class DogsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @profile = @user.profile
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
    if @dog.save
      respond_to do |format|
        format.html {redirect_to user_dogs_path(@user, @dog)}
        format.js
      end
    else
      render :index
    end
  end

  def update
    @user = User.find(params[:user_id])
    @dog = @user.dogs.find(params[:id])
    @dog.update(dog_params)
    respond_to do |format|
      format.html {redirect_to user_dogs_path(@user, @dog)}
      format.js
    end

  end

  def destroy
    @user = User.find(params[:user_id])
    @dog = @user.dogs.find(params[:id])
    @dog.destroy
    redirect_to  user_dogs_path(@user)

  end


  private
    def dog_params
      params.require(:dog).permit(:name, :age, :gender, :breed, :size, :discribtion, :user_id, :dog_avatar)
    end

    def find_user
      @user = User.find(params[:user_id])
    end
end
