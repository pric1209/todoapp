class TasksController < ApplicationController
  require 'rubygems'
  require 'RMagick'


  def new
    @board = Board.find(params[:board_id])
    @task = @board.tasks.build
    
  end
    
  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    if @task.save
      redirect_to board_path(board)
    else
      render :new
    end
  end

  def show
    @board = Board.find(params[:board_id])
    @task = Task.find(params[:id])
    @comments = @task.comments
    @image = Magick::Image.read(@task.eyecatch)
  end

  def edit
      @board = Board.find(params[:board_id])
      @task = current_user.tasks.find(params[:id])
  end
  
  def update
    @board = Board.find(params[:board_id])
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to board_task_path(board_id: @board.id, id: @task.id)
    else
      render :edit
    end
  end
  
  def destroy
    board = Board.find(params[:board_id])
    task = current_user.tasks.find(params[:id])
    task.destroy!
    redirect_to board_path(board)
  end

  private 
  def task_params
    params.require(:task).permit(:title, :description,:deadline, :eyecatch, :user_id)
    .merge(user_id:current_user.id)
  end
end