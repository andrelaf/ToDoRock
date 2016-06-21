class Task < ActiveRecord::Base
  belongs_to :boards
  belongs_to :user
  enum status: { ToDo: 1, InProgress: 2, ToVerify: 3, Done: 4 }
  enum priority: { Low: 1, Medium: 2, High: 3 } 

  validates :title, :priority, :status, :board_id,  presence: true

end
