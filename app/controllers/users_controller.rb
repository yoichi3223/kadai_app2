class UsersController < ApplicationController
	def index
		@new_book = Book.new
		@user =  User.find(current_user.id)
		@users = User.all
	end

	def edit
        @user =  User.find(params[:id])
	end

	def show
		@new_book = Book.new
		@user = User.find(params[:id])
		@books = @user.books
	end
		def update
	    @user = User.find(params[:id])
	    if @user.update(user_params)
	    flash[:notice] = "You have updated user successfully."
	    redirect_to user_path(current_user.id)
	    else
	    @new_book = Book.find(params[:id])
	    render "show"
	   end
    end
  	private
  	def user_params
		params.require(:user).permit(:title, :profile_image,:introduction)
	end


end
