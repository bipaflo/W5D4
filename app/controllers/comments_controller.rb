class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    @comment = Comment.new(comment_params)
    @comment.gossip_id = params[:gossip_id]
    @comment.user_id = current_user.id
    puts "*" * 60
    @user = User.find(@comment.user_id)
    puts "*" * 60
    @comment.author = current_user.first_name
    if @comment.save
      flash[:success] = "Ton commentaire a bien été posté !"
      redirect_to gossip_path(@comment.gossip)
      return
    else      
    end
  end 

  def edit
    @comment = Comment.find(params[:id])
    @comment.gossip_id = params[:gossip_id]
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:sucess] = "Ton commentaire a bien été modifié !"
      redirect_to root_path
      return
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@gossip)
  end

  private 

  def comment_params
    params.require(:comment).permit(:content, :author)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
