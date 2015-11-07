class BoardsController < ApplicationController
  before_action :board, only: :create
  before_action :find_board, only: [:show, :destroy, :update]

  def index
    render json: current_user.boards, status: 200
  end

  def create
    if @board.update(board_params)
      current_user.boards << @board
      render json: @board, status: 200
    else
      render json: { status: :error, error: @board.errors.messages }, status: 422
    end
  end

  def show
    render json: @board.to_json, status: :ok
  end

  def destroy
    @board.destroy
    head(200)
  end

  private

  def find_board
    @board = Board.find(params[:id])
  end

  def board
    @board = Board.new
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
