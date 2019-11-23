class CommentsController < ApplicationController
  
  
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.build(content_params)
    if @comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      redirect_to topics_path, danger: 'コメントに失敗しました'
    end 
      
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to topics_path, success: 'コメントを削除しました'
  end
  
  
  private
    def content_params
      params.require(:comment).permit(:content)
    end 
end
