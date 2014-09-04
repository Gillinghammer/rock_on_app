class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :q, :bands

  before_filter :load_search
  
  rescue_from CanCan::AccessDenied do |exception| redirect_to root_path, alert: "You can't access this page" end

  def load_search
    @q = Band.search(params[:q])
    @bands = @q.result(distinct: true)
  end

  private
  begin
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound 
      session[:user_id] = nil
    end
  end
  
end


