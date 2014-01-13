class UsersController < ApplicationController
	load_and_authorize_resource
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
  	end

	def new
		@user = User.new
	end

	def edit
	end

	def update
	    respond_to do |format|
	      if @user.update(user_params)
	        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: 'edit' }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	def destroy
	    @user.destroy
	    respond_to do |format|
	      format.html { redirect_to users_url }
	      format.json { head :no_content }
	    end
  	end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :role, :password, :password_confirmation)
    end
end
