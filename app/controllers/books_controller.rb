class BooksController < ApplicationController
	def index
	end

	def show
	end

	def edit
	end
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to user_path(current_user)
	end

	def destroy
	end

	def book_params
		params.require(:book).permit(:title, :body)
	end
end
