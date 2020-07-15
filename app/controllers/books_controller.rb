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
	def update
	    # list = List.find(params[:id])
	    # list.update(list_params)
	    # redirect_to todolist_path(list.id)
  	end

	def destroy
	end
	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
