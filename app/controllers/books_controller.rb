class BooksController < ApplicationController
  def new
      @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if current_user
      @book.user_id = current_user.id
    end
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end