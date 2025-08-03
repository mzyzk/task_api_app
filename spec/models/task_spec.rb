require "rails_helper"

RSpec.describe Task, type: :model do
  describe "validations" do
    it "is valid with a title" do
      task = build(:task)
      expect(task).to be_valid
    end

    it "is invalid without a title" do
      task = build(:task, title: nil)
      expect(task).not_to be_valid
    end

    it "adds an error message when title is blank" do
      task = build(:task, title: nil)
      task.valid?
      expect(task.errors[:title]).to include("can't be blank")
    end

    it "defaults completed to false" do
      task = Task.new(title: "Test Task")
      expect(task.completed).to be false
    end
  end
end
