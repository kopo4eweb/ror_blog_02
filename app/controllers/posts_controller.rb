class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: t('posts.controller.create.success')
    else
      flash.now[:danger] = t('posts.controller.create.danger')
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, success: t('posts.controller.update.success')
    else
      flash.now[:danger] = t('posts.controller.update.danger')
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: t('posts.controller.destroy.success')
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags, :category_id)
  end
end
