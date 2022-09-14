class ApplicationController < ActionController::Base
  def current_user
    if session[:user_id].blank?
      @current_user = nil
    else
      @current_user ||= User.find_by(auth_user_id: session[:user_id])
    end

    @current_user
  end
  helper_method :current_user
end
