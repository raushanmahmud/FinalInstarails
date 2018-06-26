class UsersController < ApplicationController

	def index 
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			redirect_to @user
		else
			render :new
		end
	end

	def update #todo
		@user = User.find(params[:id])
		if (@user.update(user_params))
			redirect_to @user
		else
			render :edit
		end

	end

	def destroy #todo

		@user = User.find(params[:id])
		if @user==current_user 
			@user.destroy
		end
		redirect_to users_path
	end

	def edit #todo
		@user = User.find(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :avatar)
	end

end
