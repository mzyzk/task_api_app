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
    let(:non_existing_id) { Task.maximum(:id).to_i + 1 }

    it "returns the task with correct structure" do
      get "/api/v1/tasks/#{task.id}"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json["id"]).to eq(task.id)
      expect(json.keys).to contain_exactly("id", "title", "description", "due_date", "completed", "created_at", "updated_at")
    end

    it "returns 404 if task not found" do
      get "/api/v1/tasks/#{non_existing_id}"
      expect(response).to have_http_status(:not_found)
      json = JSON.parse(response.body)
      expect(json["error"]).to eq("Task not found")
    end
  end

  describe "POST /create" do
    it "creates a task with correct structure" do
      valid_params = { task: { title: "New Task" } }

      post "/api/v1/tasks", params: valid_params

      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json["title"]).to eq("New Task")
      expect(json.keys).to contain_exactly("id", "title", "description", "due_date", "completed", "created_at", "updated_at")
    end

    it "returns error when title is missing" do
      invalid_params = { task: { title: "" } }

      post "/api/v1/tasks", params: invalid_params

      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body)
      expect(json["title"]).to include("can't be blank")
    end
  end

  describe "PUT /update" do
    let(:task) { create(:task, title: "Old Title") }

    it "updates the task with correct structure" do
      put "/api/v1/tasks/#{task.id}", params: { task: { title: "Updated Title" } }

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json["title"]).to eq("Updated Title")
      expect(json.keys).to contain_exactly("id", "title", "description", "due_date", "completed", "created_at", "updated_at")
    end

    it "returns 404 if task not found" do
      put "/api/v1/tasks/9999", params: { task: { title: "Whatever" } }

      expect(response).to have_http_status(:not_found)
      json = JSON.parse(response.body)
      expect(json["error"]).to eq("Task not found")
    end

    it "returns error when title is blank" do
      put "/api/v1/tasks/#{task.id}", params: { task: { title: "" } }

      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body)
      expect(json["title"]).to include("can't be blank")
    end
  end

  describe "DELETE /destroy" do
    let!(:task) { create(:task) }
    let(:non_existing_id) { Task.maximum(:id).to_i + 1 }

    it "deletes the task" do
      delete "/api/v1/tasks/#{task.id}"

      expect(response).to have_http_status(:no_content)
      expect(Task).not_to exist(task.id)
    end

    it "returns 404 if task not found" do
      delete "/api/v1/tasks/#{non_existing_id}"

      expect(response).to have_http_status(:not_found)
      json = JSON.parse(response.body)
      expect(json["error"]).to eq("Task not found")
    end
  end
end
