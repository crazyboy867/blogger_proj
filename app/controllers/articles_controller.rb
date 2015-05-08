class ArticlesController < ApplicationController
	include ArticlesHelper

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])#when link clicked find article based on 'id' parameter
		@comment = Comment.new
		@comment.article_id = @article.id


	end
  
	def new
		@article = Article.new
	end
=begin

	def create
  		@article = Article.new
  		@article.title = params[:article][:title]
  		@article.save
  		redirect_to article_path(@article)
	end

	def create
  		@article = Article.new(
    	title: params[:article][:title],
    	body: params[:article][:body])
  		@article.save
  		redirect_to article_path(@article)
	end
=end

  def create
    @article = Article.new(article_params)
    @article.save
  	flash.notice = "Article '#{@article.title}' Created!"

    redirect_to article_path(@article)
  end

  def destroy
  	@article = Article.find(params[:id])
  	@article.destroy

  	flash.notice = "Article '#{@article.title}' Destroyed!"

  	redirect_to articles_path

  end

  def edit
  	@article = Article.find(params[:id])
  end

  def update
  	@article = Article.find(params[:id])
  	@article.update(article_params)
  	flash.notice = "Article '#{@article.title}' Updated!"
   	redirect_to article_path(@article)
  end
end
