class UsersController < ApplicationController
	def edit
        @user =  User.find(params[:id])
	end

	def show
		@book = Book.new
		@user = User.find(params[:id])
	end
		def update
	    @user = User.find(params[:id])
	    @user.user_id = current_user.id
	    @user.update(user_params)
	    redirect_to root_path
  	end

  	def user_params
		params.require(:user).permit(:title, :profile_image,:introduction)
	end


end
