class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(list_params)
    #savaでデータ保存している
    book.save
    redirect_to '/books'
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(list_params)
    redirect_to book_path(book.id)
  end

   private
  # ストロングパラメータ
  def list_params
    params.require(:book).permit(:title, :body)
  end
end
