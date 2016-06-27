class Task < ActiveRecord::Base
  belongs_to :board
  belongs_to :user
  enum status: { ToDo: 1, InProgress: 2, ToVerify: 3, Done: 4 }
  enum priority: { Low: 1, Normal: 2, High: 3, Blocking: 4 } 
  validates_presence_of :title, :priority, :status, :board_id
  validates_length_of :title, :minimum => 10
  validates_length_of :title, :maximum => 200
  validates_inclusion_of :status, in: statuses.keys
  validates_inclusion_of :priority, in: priorities.keys
  
end
