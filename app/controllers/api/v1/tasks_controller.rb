module Api
  module V1
    class TasksController < ApplicationController
      def index
        tasks = Task.all.order(created_at: :desc)
        render json: tasks
      end

      def show
        task = Task.find(params[:id])
        render json: task
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Task not found" }, status: :not_found
      end

      def create
        task = Task.new(task_params)
        if task.save
          render json: task, status: :created
        else
          render json: task.errors, status: :unprocessable_entity
        end
      end

      def update
        task = Task.find(params[:id])
        if task.update(task_params)
          render json: task
        else
          render json: task.errors, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Task not found" }, status: :not_found
      end

      def destroy
        task = Task.find(params[:id])
        task.destroy!
        head :no_content
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Task not found" }, status: :not_found
      end

      private

        def task_params
          params.require(:task).permit(:title, :description, :due_date, :completed)
        end
    end
  end
end
