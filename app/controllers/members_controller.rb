class MembersController < ApplicationController
  before_action :user_board, only: :create
  before_action :find_user_board, only: :destroy

  def index
    render json: ActiveModel::ArraySerializer.new(Board.find(params[:board_id]).members,
                                                  each_serializer: MemberSerializer,
                                                  scope: { board_id: params[:board_id] }), status: 200
  end

  def create
    if @user_board.update(user_board_params)
      @user_board.user.add_role(user_board_params[:role].to_sym, @user_board.board)
      render json: MemberSerializer.new(@user_board.user), board_id: @user_board.board_id, status: 200
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
    @user_board = UserBoard.find_by(user_id: params[:id], board_id: params[:board_id])
  end

  def user_board
    @user_board ||= UserBoard.new
  end

  def user_board_params
    params.require(:user_board).permit(:board_id, :user_id, :role)
  end
end
