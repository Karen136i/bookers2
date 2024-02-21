class BooksController < ApplicationController
  
  
  def create #投稿の保存画面
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def index #投稿の一覧画面
    @books = Book.all
    @users = @books
  end

  def show #投稿ごとの詳細ページ
    @book = Book.find(params[:id])
    @user = @book.user
    @users = User.all
  end

  def edit #編集画面
    @book = Book.find(params[:id])
  end
  
  def update #更新機能の追加
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
   
  
  def destroy #削除機能の追加
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end 
end
