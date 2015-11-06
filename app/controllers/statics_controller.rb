class StaticsController < ApplicationController
  def index

  end

  def profile
    @user = current_user
    @owner = Owner.new()
    render :profile

  end
end
