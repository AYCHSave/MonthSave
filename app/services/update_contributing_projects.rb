class UpdateContributingProjects
  def initialize(user)
    @user = user
  end

  def call(params)
    @params = params

    update_existing_projects if @params['existing_projects']
    create_new_project if @params['project_user']['project'].present?
  end

  protected

  def update_existing_projects
    @params['existing_projects'].each do |id, percentage|
      if percentage.to_i == 0
        @user.contributing_projects.find(id).destroy
      else
        project = @user.contributing_projects.find(id)
        project.update(percentage: percentage)
      end
    end
  end

  def create_new_project
    project_id = @params['project_user']['project']

    project = Project.find(project_id.to_i)
    @user.contributing_projects.create(project: project, percentage: 30)
  end
end
