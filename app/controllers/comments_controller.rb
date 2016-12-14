class CommentsController < ApplicationController
	def create
		# Recupera o article específico pelo id
		@article = Article.find(params[:article_id])
		# Usa relação artigo x comentário e cria um comentário no artigo específico 
		@article.comments.create comment_params
		# Redireciona para o artigo específico 
		redirect_to article_path(@article)
	end

	private
	def comment_params
		#:comment é uma chave do hash params que tem como valor os inputs do form
		params.require(:comment).permit(:commenter, :body)
	end
end
