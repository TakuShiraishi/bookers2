class UsersController < ApplicationController
  before_action :login_user, only: [:edit]
  def index
    @books = User.all
    @book = Book.new
    @user = current_user
  end


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book1 = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = "You have updated user successfully."
  else
    render :edit
  end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def login_user
     @user = User.find(params[:id])
     redirect_to user_path(current_user) unless @user == current_user
  end
end
