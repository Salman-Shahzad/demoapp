class CommentsController < ApplicationController
    before_action :set_comment, only: [:show,:edit, :update ,:destroy]
    def show
    end
    def index
        @comments=Comment.all
    end

    def new
        @comment=Comment.new

    end

    def create
        @comment= Comment.new(comment_params)
        if @comment.save
            flash[:noitce]="Comment created"
            redirect_to @comment
        else
            render 'new'
        end
    end

    def edit
    end

    def update
    
        if @comment.update(comment_params)
            flash[:notice]="Comment Updated"
            redirect_to @comment
        else
            redirect_to 'edit'
        end

    end

    def destroy
        @comment.destroy
        redirect_to comments_path
        flash[:notice]="Comment deleted"
    end
    private
     def set_comment
        @comment = Comment.find(params[:id])
     end
     def comment_params
        params.require(:comment).permit(:comment,:user_id)
     end
    
end
