class TasksController < ApplicationController
  def index
    @tasks = Task.where({"user_id" => @current_user["id"]) #As a signed-in user, I want to see only my tasks
    @task = Task.new
  end


  def create
    @task = Task.new
    @task["description"] = params["task"]["description"]
    @task["user_id"] = @current_user["id"] #As a signed in user, I want to create new tasks for myself
    @task.save
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    if @task["user_id"] == @current_user
      @task.destroy
    end
    redirect_to "/tasks"
  end
end
