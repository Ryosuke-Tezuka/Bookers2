class BooksController < ApplicationController

  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to books_path
    end
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "Successfully Completed!!"
    redirect_to books_path
    else
    render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.new
    @book_detail = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @books = Book.all
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "Successfully Completed!!"
    redirect_to book_path(@book.id)
    else
    render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Successfully Completed!!"
    redirect_to books_path
  end


  private

    def book_params
      params.require(:book).permit(:title, :body, :user_id)
    end

end
