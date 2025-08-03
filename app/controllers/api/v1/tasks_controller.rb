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
    end
  end
end
