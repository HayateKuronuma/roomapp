class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :search
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def search
    @q = Room.ransack(params[:q])
    @results = @q.result(distinct: true)
  end 
  
end
