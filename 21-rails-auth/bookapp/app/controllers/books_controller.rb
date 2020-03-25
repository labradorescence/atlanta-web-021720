class BooksController < ApplicationController

  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :authorized

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.author = current_author

    if @book.valid?
      @book.save
      redirect_to books_path
    else
      flash[:error] = "This didn't work fam.. Try again!!"
      redirect_to new_book_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    @book.destroy
  end

  private
  def find_book
    @book = Book.find_by(id: params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :desc)
  end

end
