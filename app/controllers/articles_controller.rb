class ArticlesController < ApplicationController

	before_action :set_article, only: [:show, :edit, :update, :destroy]

	#Recebe todo os artigos do banco de dados e armazena em @articles
	def index
		@articles = Article.all 
	end

	# GET
	def new 
		@article = Article.new 
	end

	# Recebe os inputs do form (params), então, salva se as condições forem verdadeiras,
	# se não renderiza a página mostrando o(s) erro(s).
	# POST
	def create
		#render plain: params
		@article = Article.new article_params
		if @article.save
			redirect_to articles_path
		else
			render 'new'
		end
	end


	#Salva em @articles o objeto com o parâmetro
	def show  
	end

	def edit 
	end	

	
	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to article_path(@article.id)
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		redirect_to articles_path
	end

	private

	#Limita os campos dos quais o user pode submeter,
	#O método permit, retorna um hash com o que você permitiu
	def article_params
		params.require(:article).permit(:title, :text)
	end

	def set_article
		@article = Article.find(params[:id])
	end

end
