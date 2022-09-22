class BooksController < ApplicationController
   before_action :login_user, only: [:edit]
  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id)
    flash[:notice] = "You have created book successfully."
    else
    @user = current_user
    @books = Book.all
    render :index
    end
  end


  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book1 = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id)
    flash[:notice] = "You have updated book successfully."
    else
    render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  def login_user
     @book = Book.find(params[:id])
     redirect_to books_path unless @book.user == current_user
  end
end
