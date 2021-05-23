# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      redirect_to posts_url
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post, :change?
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      redirect_to edit_post_url
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post, :change?
    if @post.destroy
      redirect_to posts_url
    else
      redirect_to post_url(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :user_id,
      :title,
      :message
    )
  end
end
