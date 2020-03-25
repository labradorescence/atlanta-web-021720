class ApplicationController < ActionController::Base

  helper_method :current_author

  def current_author
    if session[:author_id] && !session[:author_id].nil?
      @author = Author.find_by(id: session[:author_id])
    else
    end
  end

  def logged_in?
    !!current_author
  end

  def authorized
    if logged_in?
      current_author
    else
      redirect_to login_path
    end
  end

end
