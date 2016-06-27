class Board < ActiveRecord::Base
      has_many :tasks
      belongs_to :user
      validates_presence_of :title
      validates_length_of :title, :minimum => 10
      validates_length_of :title, :maximum => 200

end
