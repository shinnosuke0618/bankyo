class Public::PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :index, :show, :create]
  before_action :correct_user, only: [:edit, :update, :destory]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "新規投稿が完了しました。"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @posts = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿を更新しました。"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "未記入箇所がございます。"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :user_id, :title, :body)
  end

  def correct_user
    @post = Post.find(params[:id])
    @user = @post.user
    redirect_to(posts_path) unless @user == current_user
  end

end
