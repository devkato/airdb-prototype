class TablesController < InheritedResources::Base

  before_filter :authenticate_user!
  before_filter :load_project

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(params[:table])

    if @table.save
      flash[:notice] = 'Table Successfully Created.'
      redirect_to project_table_path(@project, @table)
    else
      flash[:notice] = 'Can\'t Create Table.'
      render :new
    end
  end

  def show
    @table = Table.user_is(current_user).find(params[:id])
    RealTable.set_table(@table)
    @column_names = RealTable.column_namez
    @records = RealTable.find(:all)

    logger.debug(@column_names)
    logger.debug(@records)
  end

  def update
    @table = Table.user_is(current_user).find(params[:id])

    if @table.update_attributes(params[:table])
      flash[:notice] = 'Table Successfully Updated.'
      redirect_to project_table_path(@project, @table)
    else
      flash[:notice] = 'Can\'t Create Table.'
      render :edit
    end
  end


  private


  def load_project
    @project = Project.user_is(current_user).find(params[:project_id])
  end
end
