class LikesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  def create

    like = Like.new
    idea = Idea.find params[:idea_id]
    like.idea = idea
    like.user = current_user
    respond_to do |format|

    if like.save
      format.html {redirect_to idea_path(@idea)}
      format.js { render :create_success }
    else
      format.html { render 'new' }
      format.js { render :create_failure }
    end
  end
  end

  def destroy

    idea = Idea.find params[:idea_id]
    like = current_user.likes.find params[:id]
    like.destroy
    redirect_to idea_path(idea)
  end

end
