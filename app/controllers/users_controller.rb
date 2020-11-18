class UsersController < ApplicationController
  def show
  end

  def dashboard
    @user = current_user
    case @user.role
    when "creator"
      @projects = Project.all.where(user: @user)
    when "developer"
      @projects = Project.all.where(dev: @user)
    when "angel"
      @projects = Project.all.where(angel: @user)
    end
  end

  def edit
  end

  def update
  end
end
