class CommentsController < ApplicationController
	#http_basic_authenticate_with :name => "dhh", :password => "secret", :only => [:destroy]

	#include ActiveModel::MassAssignmentSecurity

	before_filter :authenticate_user!

	def index
		
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment])
		@comment.id = current_user.id
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)		
	end


end
