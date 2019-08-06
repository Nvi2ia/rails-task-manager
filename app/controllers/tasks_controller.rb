class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @complete = checked?
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save

    redirect_to task_path(task)
  end

  private
    def checked?
      if @task.completed
      return "this task is complete"
      else
      return "this task is not complete"
      end
    end


  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
