class UsersController < ApplicationController
	load_and_authorize_resource
	#before_filter :authenticate_user!
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :role, :password, :password_confirmation)
    end
end
