class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]

	def index
	end

	def show
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(articles_params)

		if @article.save
			redirect_to @article
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @article.update(articles_params)
			redirect_to @article
		else
			render :edit
		end
	end

	def destroy
		@article.destroy
		redirect_to root_path
	end

	private
		def articles_params
			params.require(:article).permit(:title, :content)
		end

		def find_article
			@article = Article.find(params[:id])
		end
end
