class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :api]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.title.downcase!
    if @project.save
      redirect_to @project, notice: 'A new project was successfully created.'
    else
      render :new
    end
  end

  def api
    @search = params[:search]
    @results = Project.all.where("title LIKE ?", "%#{@search}%")
  end

  private

    def project_params
      params.require(:project).permit(:title, :description)
    end
end
