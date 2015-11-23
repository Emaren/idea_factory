class JoinsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    join = current_user.joins.new
    idea = Idea.find params[:idea_id]
    join.idea = idea
    if join.save
      redirect_to idea_path(idea), notice: "Joined the Idea!"
    else
      redirect_to idea_path(idea), alert: "Error!"
    end
  end

  def destroy
    idea = Idea.find params[:idea_id]
    join = current_user.joins.find params[:id]
    join.destroy
    redirect_to idea_path(idea), notice: "Left the Idea!"
  end

end
