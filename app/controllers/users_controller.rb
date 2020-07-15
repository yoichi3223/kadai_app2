class UsersController < ApplicationController
	def index

	end

	def edit
        @user =  User.find(params[:id])
	end

	def show
		@book = Book.new
		@user = User.find(params[:id])
		@books = @user.books
	end
		def update
	    @user = User.find(params[:id])
	    @user.update(user_params)
	    redirect_to user_path(current_user.id)
  	end
  	private
  	def user_params
		params.require(:user).permit(:title, :profile_image,:introduction)
	end


end
