class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end
  
  def create
    @board = Board.new(params_board)
    if @board.save
      redirect_to root_path, notice:'新增成功'
    else
      render :new
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(params_board)
      redirect_to root_path, notice:'編輯成功'
    else
      render :new
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to root_path, notice:'已刪除'
  end



  private
  def params_board
    params.require(:board).permit(:title)
  end
end