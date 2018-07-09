class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
  	@users = User.all.order(created_at: :desc)
  end
  def edit
		 @user = User.find(params[:id])
  end
  def update
      
  end
  def admination
    if current_user.admin?
      @user = User.find(params[:id])
    	@user.update_attribute :admin, true
      redirect_to action: :index
    end
  end
  def deadmination
    if current_user.admin?
      @user = User.find(params[:id])
      @user.update_attribute :admin, false
      redirect_to action: :index
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @users = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit( :admin, :email)
    end

end
