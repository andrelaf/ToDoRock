class Task < ActiveRecord::Base
  belongs_to :boards
  
  #enum status: { to_do: 1, in_progress: 2, to_verify: 3, done: 4 }
  #enum priority: { low: 1, average: 2, high: 3 }
  
  validates :title, :priority, :status, :board_id,  presence: true

end
