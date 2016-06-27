require 'test_helper'

class TaskTest < ActiveSupport::TestCase
 should validate_presence_of(:title)
 should validate_presence_of(:priority)
 should validate_presence_of(:status)
 should validate_presence_of(:board_id)
 
 should belong_to(:board)
 should belong_to(:user)
 
 should validate_length_of(:title).is_at_least(10).is_at_most(200)
 
 should allow_value("ToDo").for(:status)
 should allow_value("InProgress").for(:status)
 should allow_value("ToVerify").for(:status)
 should allow_value("Done").for(:status)
 
 should allow_value("Low").for(:priority)
 should allow_value("Normal").for(:priority)
 should allow_value("High").for(:priority)
 should allow_value("Blocking").for(:priority)
 

end
