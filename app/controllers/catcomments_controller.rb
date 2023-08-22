class CatcommentsController < ApplicationController
    before_action :set_cat_comment, only: %i[ shoe edit update destroy]

def index
  @catcomments = Cat_Comment.ApplicationController
  end

  def new
    @catcooment = Cat_Comment.new
  end

  def create
    @article = Article.find(params[:cat_comment] [:article_id])    
    @cat_comment = Cat_Comment.new(comment_params)

        @cat_comment.user = current_catuser
        respond_to do |format|
        if @cat_comment.save
        format.html { redirect_to cat_comment_url(@cat_comment), notice:
        'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @cat_comment}
        else
        format.html { render :new, status: :unprocessable_entity}
        format.json{ render json: @cat_comment.errors, status: :unprocessable_entity }
        
        end
      end
    end

    def update
      respond_to do |format|
        if @cat_comment.update(cat_comment_params)
          format.html { redirect_to comment_url(@cat_comment), notice: "Comment was successfully updated." }
          format.json { render :show, status: :ok, location: @cat_comment }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @cat_comment.errors, status: :unprocessable_entity }
        end
      end
    end


        private
        def cat_comment_params
            params.require(:cat_comment).permit(:content, :article_id)
end
end

