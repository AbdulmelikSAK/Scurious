class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def dashboard
    @user = current_user
    case @user.role
    when "creator"
      @projects = Project.where(user: @user)
    when "developer"
      @projects = Project.where(dev: @user)
    when "angel"
      @projects = Project.where(angel: @user)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:profile, :photo)
  end
end

