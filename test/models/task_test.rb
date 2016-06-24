require 'test_helper'

class TaskTest < ActiveSupport::TestCase
 fixtures :tasks
  test "task attributes must not be empty" do
   task = Task.new
   assert task.invalid?
   assert task.errors[:title].any?
   assert task.errors[:status].any?
   assert task.errors[:priority].any?
   assert task.errors[:board_id].any?
  end
end
