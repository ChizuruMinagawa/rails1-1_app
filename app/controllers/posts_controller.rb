class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :starrt_date, :end_date, :checkbox, :memo))
    if @post.save
      flash[:notice] = "予定を新規登録しました"
      redirect_to("/posts/index")
    else
      render "new"
   end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end