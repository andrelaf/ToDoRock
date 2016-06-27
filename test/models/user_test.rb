require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should validate_uniqueness_of(:email)
  should validate_presence_of(:name)
  
  should have_many(:boards)
  should have_many(:tasks)
  
  should validate_length_of(:password).is_at_least(8).is_at_most(72)
end
