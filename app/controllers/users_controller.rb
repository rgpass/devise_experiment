class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update]

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	private

		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password,
				:password_confirmation)
		end

		def signed_in_user
			redirect_to new_user_session_url, 
				notice: "Please sign in." unless user_signed_in?
		end
end
