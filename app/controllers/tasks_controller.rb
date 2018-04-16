class TasksController < ApplicationController
	 before_action :set_task, only: [:show, :update, :destroy]


  expose :task, -> { Task.find(params[:id]) }
	  # GET /tasks
	  def index
	    tasks = Task.all
	    render json: tasks
	  end

	  # GET /tasks/1
	  def show
	    render json: task
	  end

	  # POST /tasks
	  def create
	    task = Task.create(task_params)
	    render json: task.id, status: :created
	  end

	  # PATCH/PUT /tasks/1
	  def update
	  # @task = Task.find params[:id]
	  # @task.update_attributes task_params
	    if task.update(task_params)
	      render json: @task
	    else
	      render json: @task.errors, status: :unprocessable_entity
	    end
	  end

	  # DELETE /tasks/1
	  def destroy
	   #task = Task.find params[:id]
	   task.destroy
	  end

	  private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_task
	      @task = Task.find(params[:id])
	    end

	    # Only allow a trusted parameter "white list" through.
	    def task_params
	      params.require(:task).permit(:title, :description, :priority, :date)
	    end
	end
