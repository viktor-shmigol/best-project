class TaskListsController < ApplicationController
  before_action :task_list, only: :create
  before_action :find_task_list, only: [:destroy, :update]

  def index
    render json: TaskList.by_board(params[:board_id]), status: 200
  end

  def create
    if @task_list.update(task_list_params)
      render json: @task_list, status: 200
    else
      render json: { status: :error, error: @task_list.errors.messages }, status: 422
    end
  end

  def destroy
    @task_list.destroy
    head(200)
  end

  def update
    if @task_list.update(task_list_params)
      render json: @task_list, status: 201
    else
      render json: {status: :error, error: @task_list.errors.messages}, status: 422
    end
  end

  private

  def find_task_list
    @task_list = TaskList.find(params[:id])
  end

  def task_list
    @task_list = TaskList.new
  end

  def task_list_params
    params.require(:task_list).permit(:name, :board_id, :target_position)
  end
end
