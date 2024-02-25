class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]


  def create #投稿の保存画面
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book)
   else
    @books = Book.all
    @users = @books
    @user = current_user
    flash.now[:error] = @book.errors.full_messages
    render :index
   end
  end

  def index #投稿の一覧画面
    @book = Book.new
    @books = Book.all
    @users = @books
    @user = current_user
    @errors = flash.now[:error]
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
    @book = Book.find(params[:id])
   if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
   else
    flash[:error] = @book.errors.full_messages
    render :edit
   end
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

  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end
end
