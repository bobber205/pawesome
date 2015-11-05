class StaticsController < ApplicationController
  def index

  end

  def profile
    @user = current_user
    render :profile

  end
end
