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
    @post = Post.find(params[:id])
    @post = Post.find_by(id:params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start_date, :end_date, :checkbox, :memo))
      flash[:notice] = "IDが「#{@post.id}」の情報を更新しました"
      redirect_to("/posts/index")
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "IDが「#{@post.id}」のスケジュールを削除しました"
    redirect_to("/posts/index")
  end
end