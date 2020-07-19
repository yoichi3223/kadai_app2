class UsersController < ApplicationController
	def index
		@new_book = Book.new
		@user =  User.find(current_user.id)
		@users = User.all
	end
	def edit
	    @user =  User.find(params[:id])
	    if @user != current_user
	    @books = @user.books
	    @new_book = Book.new
	    redirect_to user_path(current_user)
		end
	end

	def show
		@new_book = Book.new
		@user = User.find(params[:id])
		@books = @user.books
	end
	def update
	    @user = User.find(params[:id])
	    if @user.update(user_params)
	    flash[:notice] = "successfully"
	    redirect_to user_path
	    else
	    @new_book = Book.new
	    render :edit
	    end
    end
  	private
  	def user_params
		params.require(:user).permit(:title, :profile_image,:name,:introduction)
	end
end
