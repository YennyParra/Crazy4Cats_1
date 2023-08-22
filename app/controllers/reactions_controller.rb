class ReactionsController < ApplicationController
    def new_user_reaction
        @catuser = current_catuser
        @type = params[:reaction_type]
        @article = Article.find(params[:article_id]) if params[:article_id]
        @catcomment = CatComment.find(params[:cat_comment_id]) if params[:cat_comment_id]
        @kind = params[:kind]
        respond_to do |format|
            (@type == "comment") ? reaction_cat_comment = Reaction.find_by(catuser_id: @catuser,
        comment_id: @cat_comment.id) : reaction_article = Reaction.find_by(catuser_id: @catuser.id,
        article_id: @article.id)
            if reaction_article || reaction_cat_comment
                format.html { redirect_to article_path(@article), notice: 'You already reacted
                to this article' }
                else
                (@type == "article") ? @reaction = Reaction.new(catuser_id: @catuser.id, article_id:
                @article.id, reaction_type: @type, kind: @kind) : @reaction = Reaction.new(catuser_id:
                @catuser.id, cat_comment_id: @cat_comment.id, reaction_type: @type, kind: @kind)
                if @reaction.save!
                format.html { redirect_to article_path(@article), notice: 'Reaction was
                successfully created.' }
                else
                format.html { redirect_to article_path(@article), notice: 'Something went
                wrong' }
                 end
               end
                end
              end
            end


