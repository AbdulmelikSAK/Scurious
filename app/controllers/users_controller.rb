class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def dashboard
  end

  def edit
  end

  def update
  end
end
