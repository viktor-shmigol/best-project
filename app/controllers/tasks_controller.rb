class TasksController < ApplicationController
  before_action :find_board, only: [:create, :index]
  before_action :find_task, only: [:update, :destroy]
  before_action :task, only: :create

  def index
    render json: ActiveModel::ArraySerializer.new(@board.tasks,
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

  def find_board
    @board = Board.find(params[:board_id])
  end

  def task
    @task ||= @board.tasks.new
  end

  def task_params
    params.require(:task).permit(:title, :due_date, :list_id, :description, :status, :position, :label, :points)
  end
end
