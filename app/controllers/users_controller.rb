class UsersController < ApplicationController
before_action :authenticate_user!
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
