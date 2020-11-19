class CandidatesController < ApplicationController
  before_action :authenticate_user!

  def new
    @project = Project.find(params[:project_id])
    @candidate = Candidate.new
  end

  def create
    @user = current_user
    @candidate = Candidate.new(candidate_params)
    @candidate.status = "In progress"
    @project = Project.find(params[:project_id])
    @candidate.project = @project
    @candidate.user = @user
    if @candidate.save
      redirect_to project_path(@project)
    else
      render "new"
    end
  end

  def accepted
    @candidate = Candidate.find(params[:candidate_id])
    @project = Project.find(params[:project_id])
    @candidate.status = "Accepted"
    case @candidate.user.role
    when "developer"
      @project.dev = @candidate.user
    when "angel"
      @project.angel = @candidate.user
    end
    @candidate.save
    @project.save
    redirect_to project_path(@project)
  end

  def refused
    @candidate = Candidate.find(params[:candidate_id])
    @candidate.status = "Refused"
    @candidate.save
    redirect_to project_path(@candidate.project)
  end

  private

  def candidate_params
    params.require(:candidate).permit(:message)
  end
end
