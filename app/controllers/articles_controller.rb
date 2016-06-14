class ArticlesController < ApplicationController
	def index
		@articles = Article.all

	end

	def show
		@articles = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new article_params
		if @article.save
			redirect_to articles_path
		else
			render 'new'
		end
	end

	private
	def article_params
		params.require(:article).permit(:title, :text)#Limitando os campos dos quais o user pode submeter
		#O método permit, retorna um hash com o que você permitiu
	end
end
