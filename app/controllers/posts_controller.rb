#coding: UTF-8

class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:destroy, :new, :create, :edit, :update]
	before_action :make_sure_its_mine, only: [:destroy, :edit]
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if @post.save
			 redirect_to posts_path, notice: 'Dodano post.'
		else
			render 'new'
		end
	end
	
	def update
		@post=Post.find(params[:id])
		if @post.update(post_params)
			redirect_to posts_path, notice: 'Edytowano post.'
	else
		render 'edit'
	end
end 

private
def make_sure_its_mine
	unless current_user.id==Post.find(params[:id].to_i).user.id
		redirect_to root_url, alert: "To nie Twój post :)."
	end
		true
	end

private
def post_params
		params.require(:post).permit(:content, :title, :user_id)
	end
end