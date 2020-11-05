class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update]

    def index 
        @posts = Post.all
    end 

    def show 
        @post = Post.find_by(id: params[:id])
    end 

    def new 
        @post = Post.new
        @bloggers = Blogger.all 
        @destinations = Destination.all 
    end 

    def create 
        @post = Post.create(strong_params)

        if @post.valid? 
            redirect_to post_path(@post)
        else 
            flash[:errors] = @post.errors.full_messages 
            redirect_to new_post_path 
        end 
    end 

    def edit    
        @post = Post.find_by(id: params[:id])     
    end 

    def update 
        @post = Post.find_by(id: params[:id])
        if strong_params 
            @post.update(strong_params)
            redirect_to post_path(@post)
        else 
            @post.likes += 1 
            @post.save 
            redirect_to post_path(@post)
        end 
    end 

    private

    def strong_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end 

    def find_post
        Post.find_by(id: params[:id])
    end 
end
