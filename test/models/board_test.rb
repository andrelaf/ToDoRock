require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  fixtures :boards
  test "board attributes must not be empty" do
   board = Board.new
   assert board.invalid?
   assert board.errors[:title].any?
  end
end
