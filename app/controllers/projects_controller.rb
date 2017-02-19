class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]
  before_action :set_project_from_current_user, only: [:edit, :update, :destroy]

  # GET /projects
  def index
    @projects = Project.search(params[:search])
  end

  # GET /projects/1
  def show
  end

  # GET /projects/new
  def new
    @project = current_user.own_projects.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = current_user.own_projects.new(project_params)

    if @project.save
      redirect_to new_project_account_path(@project), notice: 'Causa salva com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Causa alterada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Causa excluída com sucesso.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find_by(uuid: params[:id])
  end

  def set_project_from_current_user
    @project = current_user.own_projects.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def project_params
    params.require(:project).permit(:title, :description, :image_url)
  end
end
