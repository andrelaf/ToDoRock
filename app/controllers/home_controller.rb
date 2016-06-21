class HomeController < ApplicationController
  def agile_board
     @task = Task.new
     render layout: "_agile_board"
  end

  def help
  end
end
