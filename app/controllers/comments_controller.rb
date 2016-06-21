class CommentsController < ApplicationController
	def create
		# Recupera o article específico(ID)
		@article = Article.find(params[:article_id])
		# 
		@comment = @article.comments.create comment_params
		# Redireciona para o artigo específico(ID)
		redirect_to article_path(@article.id)
	end

	private
	def comment_params
		#:comment é uma chave que tem como valor os inputs do form
		params.require(:comment).permit(:commenter, :body)
	end
end
