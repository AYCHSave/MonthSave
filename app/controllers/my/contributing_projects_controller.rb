class My::ContributingProjectsController < ApplicationController
  def edit
    @contributing_projects = current_user.contributing_projects
    @projects_available = Project.where.not(id: @contributing_projects.map(&:project_id))
    @new_project = ProjectUser.new
  end

  def update
    service = UpdateContributingProjects.new(current_user)
    service.call(params)

    redirect_to action: :edit, notice: 'Contribuições atualizadas com sucesso.'
  end
end
