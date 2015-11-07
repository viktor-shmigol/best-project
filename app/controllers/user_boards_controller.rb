class UserBoardsController < ApplicationController
  before_action :user_board, only: :create
  before_action :find_user_board, only: :destroy

  def create
    if @user_board.update(user_board_params)
      current_user.add_role role.to_sym, user_board.board
      render json: @board, status: 200
    else
      render json: { status: :error, error: @board.errors.messages }, status: 422
    end
  end

  def destroy
    @user_board.destroy
    head(200)
  end

  private

  def find_user_board
    @user_board = UserBoard.find(params[:id])
  end

  def user_board
    @user_board = UserBoard.new
  end

  def user_board_params
    params.require(:user_board).permit(:board_id, :user_id, :role)
  end
end
