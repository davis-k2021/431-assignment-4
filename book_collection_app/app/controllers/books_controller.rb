class BooksController < ApplicationController

  def index
    @books = Book.order(:id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if(@book.save)
      redirect_to(books_path)
      flash[:notice] = "Book \"#{@book.title}\" created successfully."
    else
      flash.now[:alert] = "Error encountered when trying to create a Book"
      render('new')
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if(@book.update_attributes(book_params))
      redirect_to(books_path)
      flash[:notice] = "Book \"#{@book.title}\" updated successfully."
    else
      flash.now[:alert] = "Error encountered when trying to update a Book"
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book \"#{@book.title}\" destroyed successfully."
    redirect_to(books_path)
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :author, :genre, :price, :published_date)
  end

end
