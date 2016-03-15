class UsersController < ApplicationController
  rescue_from ::ActiveRecord::RecordNotFound, with: :dont_url_manipulate
  rescue_from ::ActiveRecord::InvalidForeignKey, with: :dont_url_manipulate

  include UsersHelper::ForController
    
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  #before_action :admin_user, only: :destroy
    
 
  def index
    @users = User.all
  end
    
  def show
      #@report = Report.new
      @user = User.find(params[:id])
      if (params.has_key?(:rated_point) && params.has_key?(:id))
        current_user.user_ratings.new(rating_id: params[:rated_point],rated_person: params[:id]).save unless is_rated?(params[:id])
      end
  end
    
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless  current_user?(@user)
  end
    
  def new
      @user = User.new
  end
    
  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end
    
  def edit
    @user = User.find(params[:id])
  end
    
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
        @user.update_attributes(avatar: params[:user][:avatar]) unless params[:user][:avatar] == nil
        flash[:success] = 'Profile updated'
        redirect_to @user
    else
        render 'edit'
    end
  end
    
    
    
  private
  def user_params
      params.require(:user).permit(:alias, :email, :password,:password_confirmation) 
  end
  
    
end