class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    @prototype = Prototype.find(params[:prototype_id])
    if @comment.save
      redirect_to prototype_path(params[:prototype_id])
    else
      render "prototypes/show", prototype: @prototyoe, comment: @comment
    end
  end

  private 
  def comment_params
  params.require(:comment).permit(:text).merge(user_id: current_user.id,prototype_id: params[:prototype_id])
  end
end
