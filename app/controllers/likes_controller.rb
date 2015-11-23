class LikesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  def create

    like = Like.new
    idea = Idea.find params[:idea_id]
    like.idea = idea
    like.user = current_user
    if like.save
      redirect_to idea_path(idea), notice: "Liked!"
    else
      redirect_to idea_path(idea), alert: "Already Liked!"
    end
  end

  def destroy

    idea = Idea.find params[:idea_id]
    like = current_user.likes.find params[:id]
    like.destroy
    redirect_to idea_path(idea)
  end

end
