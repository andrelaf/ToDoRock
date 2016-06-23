class Board < ActiveRecord::Base
      has_many :tasks
      belongs_to :user
      validates :title,  presence: true
      validates :title, length: { minimum: 10 }
      validates :title, length: { maximum: 500 }
end
