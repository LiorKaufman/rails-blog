class CommentsController < ApplicationController

  def new
    @comment = Comment.new

  end

  def create
    @article = Article.find(params[:article_id])
    puts "i am loc 2"
   @comment = @article.comments.new(comment_params)
    puts "i am loc 2"
    if   @comment.save
      puts "i am loc 4"
      redirect_to article_path(@article)
    else
      puts "not working"
      redirect_to root_path
      # render root_path
    end
 end

   def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
   end

  private
  def comment_params
    params.require(:comment).permit(:commenter,:body)
  end
end
