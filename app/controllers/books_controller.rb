class BooksController < ApplicationController
  
  
  def create #投稿の保存画面
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    @book.save!
    redirect_to books_path
  end

  def index #投稿の一覧画面
    @books = Book.all
    @users = User.all
  end

  def show #投稿ごとの詳細ページ
    @book = Book.find(params[:id])
  end

  def edit #編集画面
   if params[:id] != "new"
    @book = Book.find(params[:id])
   end
  end
  
  def destroy #削除機能の追加
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
  
end
