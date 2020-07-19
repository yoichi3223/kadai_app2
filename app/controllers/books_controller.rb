class BooksController < ApplicationController
	def index
		@new_book = Book.new
		@user =  User.find(current_user.id)
		@books = Book.all
	end
	def show
		@new_book = Book.new
		@book = Book.find(params[:id])
		@user = @book.user
	end
	def edit
		@book = Book.find(params[:id])
		if @book.user != current_user
		redirect_to books_path
		end
	end
	def create
		@new_book = Book.new(book_params)
		@new_book.user_id = current_user.id
		if @new_book.save
		flash[:notice] = "You have creatad book successfully."
		redirect_to book_path(@new_book)
		else
		@user = User.find(current_user.id)
		@books = Book.all
        render "index"
    	end
	end
	def update
        @book = Book.find(params[:id])
	    if @book.update(book_params)
	    flash[:notice] = "You have updated book successfully."
	    redirect_to book_path(@book)
	    else
	    render :edit
		end
  	end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end
	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
