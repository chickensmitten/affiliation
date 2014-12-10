class RelationshipsController < ApplicationController
  before_action :require_user, only: [:create, :destroy]  

  def index

  end

  def create
    leader = User.find(params[:user_id])
    @user = current_user.leader_relationships.build(follower_id: current_user.id, leader_id: params[:user_id], :url=>leader.username+"_"+current_user.username)
    if @user.save
      flash[:notice] = "Added."
      redirect_to user_path(current_user)
    else
      flash[:error] = "Unable to add."
      redirect_to :back
    end
  end

  def destroy
    @friendship = Relationship.where(follower: current_user, leader: params[:user_id]).first
    if @relationship.destroy
      flash[:notice] = "Remove relationship."
      redirect_to user_path(current_user)
    else
      flash[:error] = "Unable to remove relationship."
      redirect_to :back
    end
  end

end
