class CommentsController < ApplicationController

  before_action :find_idea
  before_action :find_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def create

    @comment = @idea.comments.create(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|

    if @comment.save
      format.html {redirect_to idea_path(@idea)}
      format.js { render :create_success }
    else
      format.html { render 'ideas/show' }
      format.js { render :create_failure }
    end
  end
  end

  def edit

  end

  def update
    if @comment.update comment_params
      redirect_to idea_path(@idea)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find params[:id]

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to product_path(@comment.idea) }
      format.js   { render }
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_idea
    @idea = Idea.find params[:idea_id]
  end

  def find_comment
    @comment = @idea.comments.find params[:id]
  end

end
