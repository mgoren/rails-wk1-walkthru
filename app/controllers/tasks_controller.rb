class TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      respond_to do |format|
        format.html { redirect_to list_path(@list) }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      respond_to do |format|
        format.html { redirect_to list_path(@list) }
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to list_path(@list) }
      format.js
    end
  end

private
  def task_params
    params.require(:task).permit(:description, :done)
  end

end
