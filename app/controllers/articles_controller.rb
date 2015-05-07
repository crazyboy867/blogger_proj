class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])#when link clicked find article based on 'id' parameter

	end
end
