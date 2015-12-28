class TasksController < ApplicationController
  before_action :find_task, only: [:update, :destroy]
  before_action :task, only: :create

  def index
    render json: ActiveModel::ArraySerializer.new(Task.by_board(params[:board_id]),
                                                  each_serializer: TaskSerializer), status: 200
  end

  def create
    if @task.update(task_params)
      render json: @task, status: 200
    else
      render json: { status: :error, error: @task.errors.messages }, status: 422
    end
  end

  def destroy
    @task.destroy
    head(200)
  end

  def update
    if @task.update(task_params)
      render json: TaskSerializer.new(@task), status: 201
    else
      render json: { status: :error, error: @task.errors.messages }, status: 422
    end
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task
    @task ||= Task.new
  end

  def task_params
    params.require(:task).permit!
  end
end
