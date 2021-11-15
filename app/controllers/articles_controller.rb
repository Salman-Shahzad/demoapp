class ArticlesController < ApplicationController
    before_action :set_article, only: [:show,:edit, :update ,:destroy]
    def show
    end
    def index
        @articles=Article.all
    end

    def new
        @article=Article.new
    end

    def create
        @article= Article.new(article_params)
        if @article.save
            flash[:noitce]="Article created"
            redirect_to @article
        else
            render 'new'
        end
    end

    def edit
    end

    def update
    
        if @article.update(article_params)
            flash[:notice]="Article Updated"
            redirect_to @article
        else
            flash[:notice]="No Alteration is being made"
            redirect_to 'edit'
        end

    end

    def destroy
        @article.destroy
        redirect_to articles_path
        flash[:notice]="Article deleted"
    end
    private
     def set_article
        @article = Article.find(params[:id])
     end
     def article_params
        params.require(:article).permit(:title,:description)
     end
    
end