class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  expose :task, -> {current_user.tasks.find(params[:id])}
  expose :tasks, -> {current_user.tasks.all}

  def index
    tasks = current_user.tasks.all.order('priority ASC')
    render json: tasks, status: 200
  end

  def show
    render json: task, status: 200
  end

  def create
    task = current_user.tasks.create(task_params)
    render json: task.id, status: 201
  end

  def update
    if task.update(task_params)
      render json: task, status: 200
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if task.destroy
      return head(:ok)
    else
      return head(:bad_request)
    end
  end

  def batch_destroy
    tasks = current_user.tasks.where(id: params[:ids]).destroy_all
  end

  private

  def set_task
    # task
    task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :priority, :due_date, :active, :user_id)
  end
end
