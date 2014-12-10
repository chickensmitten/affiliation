class SignupsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @signup = Signup.new(params.require(:signup).permit(:username, :email))
    @signup.post = @post
    if @signup.save
      flash[:notice] = 'Thank you for Signing Up.'
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end

  end
end