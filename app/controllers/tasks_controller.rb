class TasksController < ApplicationController
    def new
      @board = Board.find(params[:board_id])
      @task = @board.tasks.build
      
    end

    def create
        board = Task.find(params[:task][:board_id])
        @task = current_user.tasks.build(task_params)
        if @task.save
          redirect_to board_path(board)
        else
          render :new
        end
    end

    def show
        @task = Task.find(params[:id])
    end

    def edit
        @task = current_user.tasks.find(params[:id])
    end
    
    def update
      @task = current_user.tasks.find(params[:id])
      if @task.update(task_params)
        # binding.pry
        redirect_to task_path(@task)
      else
        render :edit
      end
    end
    
    def destroy
      task = current_user.tasks.find(params[:id])
      task.destroy!
      redirect_to tasks_path
    end

    private 
    def task_params
      params.require(:task).permit(:title, :description,:deadline, :eyecatch)
    end
end