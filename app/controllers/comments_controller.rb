class CommentsController < ApplicationController
  
  def new
   @topic=Topic.find(params[:topic_id])
   @comment=Comment.new
  end 
  
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.build(content_params)
    if @comment.save
      redirect_to new_topic_comment_path, success: 'コメントしました'
    else
      redirect_to new_topic_comment_path, danger: 'コメントに失敗しました'
    end 
  end

  def destroy
    Comment.destroy(params[:id])
    redirect_to new_topic_comment_path, success: 'コメントを削除しました'
  end 
  
  private
    def content_params
      params.require(:comment).permit(:content)
    end 
end
