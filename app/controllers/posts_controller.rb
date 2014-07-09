class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :description, :image, :tag_names))
    @post.user = current_user
    @post.save!

    redirect_to posts_path
  end

  def show
    @post = Post.find_by_title params[:id]
  end

  def index
    @posts = Post.all
  end
end
