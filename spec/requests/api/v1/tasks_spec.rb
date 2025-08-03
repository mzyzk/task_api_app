require "rails_helper"

RSpec.describe "Api::V1::Tasks", type: :request do
  describe "GET /index" do
    it "returns all tasks with correct structure" do
      create_list(:task, 3)
      get "/api/v1/tasks"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.size).to eq(3)
      expect(json.first.keys).to contain_exactly("id", "title", "description", "due_date", "completed", "created_at", "updated_at")
    end
  end

  describe "GET /show" do
    let(:task) { create(:task) }

    it "returns the task with correct structure" do
      get "/api/v1/tasks/#{task.id}"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json["id"]).to eq(task.id)
      expect(json.keys).to contain_exactly("id", "title", "description", "due_date", "completed", "created_at", "updated_at")
    end

    it "returns 404 if task not found" do
      non_existing_id = Task.maximum(:id).to_i + 1
      get "/api/v1/tasks/#{non_existing_id}"
      expect(response).to have_http_status(:not_found)
      json = JSON.parse(response.body)
      expect(json["error"]).to eq("Task not found")
    end
  end
end
