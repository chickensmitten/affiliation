class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :timeline]
  before_action :require_same_user, only: [:edit, :update]    

  def landing
  end
  
  def show
    @posts = current_user.posts.paginate(:page => params[:page], :per_page => 30) if current_user.present?
  end

  def index
    @users = User.paginate(:page => params[:page], :per_page => 30)  
  end

  def timeline
    @posts = @user.feed.paginate(:page => params[:page], :per_page => 30) 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You're registered."
      redirect_to root_path
    else
      render :new
      flash[:notice] = "Username or email taken."
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your profile was updated."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :id)
  end

  def set_user  
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:error] = "You're not allowed to do that."
      redirect_to root_path
    end
  end
end
















