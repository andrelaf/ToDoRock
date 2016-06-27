require 'test_helper'

class BoardTest < ActiveSupport::TestCase
    should validate_presence_of(:title)
   
    should have_many(:tasks)
    should belong_to(:user)
    
    should validate_length_of(:title).is_at_least(10).is_at_most(200)
end
