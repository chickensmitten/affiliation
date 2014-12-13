class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.where(username: params[:username]).first
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token        
      end
      flash[:notice] = "Welcome, you've logged in."
      redirect_to posts_path
    else
      flash[:error] = "There is something wrong with your username or password."
      redirect_to login_path
    end
  end

  def destroy
    cookies.delete(:auth_token)
    flash[:notice] = "You've logged out."
    redirect_to login_path
  end

end