class ListsController < ApplicationController
  before_action :find_board, only: [:create, :index]
  before_action :list, only: :create
  before_action :find_list, only: [:destroy, :update]

  def index
    render json: ActiveModel::ArraySerializer.new(@board.lists,
                                                  each_serializer: ListSerializer), status: 200
  end

  def create
    if @list.update(list_params)
      render json: @list, status: 200
    else
      render json: { status: :error, error: @list.errors.messages }, status: 422
    end
  end

  def destroy
    @list.destroy
    head(200)
  end

  def update
    if @list.update(list_params)
      render json: @list, status: 201
    else
      render json: { status: :error, error: @list.errors.messages }, status: 422
    end
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def find_board
    @board = Board.find(params[:board_id])
  end

  def list
    @list ||= @board.lists.new
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
