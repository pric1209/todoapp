class TasksController < ApplicationController
    def new
        @task = current_user.tasks.build
    end

    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
        redirect_to task_path(@task)
        else
        render :new
        end
    end

    def show
        @task = Task.find(params[:id])
    end

    private 
    def task_params
      params.require(:task).permit(:title, :description,:deadline, :eyecatch)
    end
end