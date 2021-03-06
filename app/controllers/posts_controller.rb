class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.posts_by(current_user).page(params[:page]).per(10)
	end

	def new
		@post = Post.new
	end

	def edit
		authorize @post
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to @post, notice: "Your post is successfully created."
		else
			render :new
		end
	end

	def update
		authorize @post
		if @post.update(post_params)
			redirect_to @post, notice: "Your post is successfully updated."
		else
			render :edit
		end
	end

	def show
	end

	def destroy
		@post.delete
		redirect_to posts_path, notice: "Your post was successfully deleted."
	end

	private

	def post_params
		params.require(:post).permit(:date, :rationale,:status,:overtime_request)
	end

	def set_post
		@post = Post.find(params[:id])
	end
end
