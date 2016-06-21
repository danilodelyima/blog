class ArticlesController < ApplicationController
	def index
		#Recebe todo o conteúdo do banco de dados e armazena em @articles
		@articles = Article.all 
	end

	def show
		#Salva em @articles o objeto com o parâmetro
		@article = Article.find(params[:id])  
	end

	def new
		# Obtém a própria página. 
		# GET
		@article = Article.new 
	end

	def edit
		@article = Article.find(params[:id])  
	end	

	def create
		# Recebe os inputs do form (params), então, salva se as condições forem verdadeiras,
		# se não renderiza a página mostrando o(s) erro(s).
		# POST
		@article = Article.new article_params
		if @article.save
			redirect_to articles_path
		else
			render 'new'
		end
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
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path

	end

	private
	def article_params
		#Limita os campos dos quais o user pode submeter,
		#O método permit, retorna um hash com o que você permitiu
		params.require(:article).permit(:title, :text)
	end
end
