class SessionsController < ApplicationController

  def new
  end

  def create
    @author = Author.find_by(:username => sessions_params[:username])
    if @author && @author.authenticate(sessions_params[:password])
      session['author_id'] = @author.id
      redirect_to author_path(@author)
    else
      redirect_to login_path
    end
  end

  def destroy
    session['author_id'] = nil
    redirect_to login_path
  end

  private
  def sessions_params
    params.permit(:username,:password)
  end

end
