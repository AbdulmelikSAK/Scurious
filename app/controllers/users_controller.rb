class UsersController < ApplicationController
  def show
  end

  def dashboard
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
    params.require(:user).permit(:profile)
  end
end
