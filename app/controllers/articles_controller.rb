class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
        # @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new # to initialize so no error occurs in new.html.erb
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first  # after many-many, so that new articles created have temporary user_id value, for temp editing articles, use Article.update_all(user_id = User.first)
        if @article.save
            flash[:notice] = "Article created successfully"
            redirect_to @article   # redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def edit
        # @article = Article.find(params[:id])
    end

    def update
        # @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article updated successfully"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        # @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private
    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end