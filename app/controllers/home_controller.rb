class HomeController < ApplicationController
  def agile_board
     @task = Task.new
  end

  def help
  end
end
