class CandidatesController < ApplicationController
  before_action :authenticate_user!

  def new
    @project = Project.find(params[:project_id])
    @candidate = Candidate.new
  end

  def create
    @user = current_user
    @candidate = Candidate.new(candidate_params)
    @project = Project.find(params[:project_id])
    @candidate.project = @project
    @candidate.user = @user
    if @candidate.save
      redirect_to project_path(@project)
    else
      render "new"
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit(:message)
  end
end
