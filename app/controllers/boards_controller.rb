class BoardsController < ApplicationController
  def index
    @board = Board.first
  end

  def new
    @board = Board.new
    # @board = current_user.boards.build(board_params)
    # if @board.save
    #   redirect_to board_path(@board_params), notice:'保存できたよ'
    # else
    #   flash.now[:error] = '保存に失敗しました'
    #   render :new
    # end
  end

  def create 
    @board = Board.new(board_params)
    if @board.save
      redirect_to board_path(@board_params), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end


  def show
    @board = Board.find(params[:id])
  end

  private 
  def board_params
    puts '===================='
    puts params
    params.require(:board).permit(:title, :description)
  end
end