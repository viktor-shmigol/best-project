class TasksController < ApplicationController
  before_action :all_tasks, only: :index

  def index
    render json: ActiveModel::ArraySerializer.new(@tasks,
                                                  each_serializer: TaskSerializer), status: 200
  end

  private

  def all_tasks
    @tasks = current_user.tasks
  end
end
