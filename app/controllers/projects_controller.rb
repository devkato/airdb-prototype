class ProjectsController < InheritedResources::Base

  before_filter :authenticate_user!

  def index
    @projects = Project.user_is(current_user).page(params[:page])
  end
end
