class BloggersController < ApplicationController

    def index 
        @bloggers = Blogger.all 
    end 

    def new 
        @blogger = Blogger.new
    end 

    def create 
        @blogger = Blogger.create(strong_params)

        if @blogger.valid? 
            redirect_to blogger_path(@blogger)
        else 
            flash[:errors] = @blogger.errors.full_messages 
            redirect_to new_blogger_path 
        end 
    end 

    def show
        @blogger = Blogger.find_by(id: params[:id])
    end 

    private 

    def strong_params
        params.require(:blogger).permit(:name, :age, :bio)
    end 

end
