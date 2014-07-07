class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :description, :image))
    @post.save!

    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end
end
