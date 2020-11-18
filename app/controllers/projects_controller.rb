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
    @project.user = current_user
    @project.title.downcase!
    if @project.save
      redirect_to project_path(@project), notice: 'A new project was successfully created.'
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path(@project), notice: 'Your project was successfully updated.'
    else
      render :edit
    end
  end

  def api
    @title = params[:title]
    @results = Project.all.where("title LIKE ?", "%#{@title}%")
    @display_result = @results.map do |project|
      {
        card: render_to_string(partial: 'projectcard', locals: { project: project })
      }
    end
    render json: @display_result.to_json
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :evolution)
  end
end
