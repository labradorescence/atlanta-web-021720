class AuthorsController < ApplicationController

  before_action :current_author, only: [:show, :edit, :update, :destroy]
  before_action :authorized

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.valid?
      @author.save
      redirect_to authors_path
    else
      flash[:error] = "This didn't work fam.. Try again!!"
      redirect_to new_author_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @author.update(author_params)
    redirect_to author_path(@author)
  end

  def destroy
    @author.destroy
  end

  private
  def author_params
    params.require(:author).permit(:title, :desc, :author_id)
  end

end
