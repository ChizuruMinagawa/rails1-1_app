class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.count(:id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :start_date, :end_date, :checkbox, :memo))
    if @post.save
      flash[:notice] = "予定を新規登録しました"
      redirect_to("/")
    else
      flash.now[:notice] = "新規登録に失敗しました"
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
      redirect_to("/")
    else
      flash.now[:notice] = "情報の更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "IDが「#{@post.id}」のスケジュールを削除しました"
    redirect_to("/")
  end
end