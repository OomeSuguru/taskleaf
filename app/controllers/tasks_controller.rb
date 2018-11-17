class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def index
    @tasks = Task.all
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}を更新しました」"
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    task = Task.new(task_params)
    task.save!
    redirect_to tasks_url　notice: "タスク「#{task.name}」を登録しました"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}を削除しました」"
  end
  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
