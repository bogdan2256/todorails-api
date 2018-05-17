class TasksController < ApplicationController
  expose :task, -> {current_user.tasks.find(params[:id])}
  expose :tasks, -> {current_user.tasks.all}

  def index
    tasks = current_user.tasks.all.order('priority ASC')
    render json: tasks, status: 200,  each_serializer: TasksSerializer
  end

  def show
    render json: task, status: 200, each_serializer: TaskSerializer
  end

  def create
    task = current_user.tasks.create(task_params)
    render json: task.id, status: 201, each_serializer: TaskSerializer
  end

  def update
    if task.update(task_params)
      render json: task, status: 200
    else
      render json: task.errors, status: :unprocessable_entity, each_serializer: TaskSerializer
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

  def task_params
    params.require(:task).permit(:title, :description, :priority, :due_date, :active)
  end
end
