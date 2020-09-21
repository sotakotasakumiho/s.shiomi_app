class PostsController < ApplicationController
  def index
    @posts = current_user.posts.all 
    @post = current_user.posts.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments 
    @comment = current_user.comments.new
  end
  
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
    end
  end

  private
  def post_params
    params.require(:post).permit(:post_content)
  end
end
