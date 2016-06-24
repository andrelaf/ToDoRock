class HomeController < ApplicationController
  before_action :set_board_onchange, only: [:agile_board]
  
  def agile_board
    
     if user_signed_in?
      @boards = Board.where("user_id = ? or public = ?", current_user.id, true)
     else
      @boards = Board.where(public: true)
     end
     
     change_board
      
     
     render layout: "_agile_board"
  end
  
  def change_board
    unless @board.nil? 
     session[:board_id] = @board.id
     @tasks = Task.where(board_id: @board.id)
    end
  end
 
  
 private
 
  def set_board_onchange
   unless params[:board_id].blank?
     @board = Board.find(params[:board_id])
   else
     @board = Board.first
   end
  end

end
