class TasksController < ApplicationController
    before_action :set_task , only: [:show, :edit, :update, :destroy] #step 1


    def index
        @tasks = Task.all
        @test = "This is a Test"
    end
    
    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to task_path(@task)

        else
            render :new, status: :unprocessable_entity
        end
       
    end

    def show
    end

    def edit #step 3
    end

    def update
       if @task.update(task_params)
        redirect_to task_path(@task)
       else
        render :edit, status: :unprocessable_entity
       end
    end

    def destroy
        if @task.destroy
            redirect_to tasks_path
        else
            "GG"
        end
    end

    private

    def set_task #step 2
        @task = Task.find(params[:id])
    end


    def task_params
        params.required(:task).permit(:title, :description)
    end

end
