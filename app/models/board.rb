class Board < ActiveRecord::Base
      has_many :tasks
      validates :title, :public, presence: true
end
