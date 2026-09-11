class ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all  # this line will get all articles from database. Also @articles is instance variable so rails make it availabe for view.
  end

  def show
  end

  def new
   @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    
   if @article.save
    redirect_to @article
   else 
    render :new, status: :unprocessable_entity
   end 
end

  def edit
  end

    def update

    if @article.update(article_params)
        redirect_to @article
    else
        render :edit, status: :unprocessable_entity
    end
    end

def destroy
  @article.destroy
  redirect_to articles_path
end

private

 def article_params                          #Only allow title and description to come from the form.
  params.require(:article).permit(:title, :description)
 end
 
def set_article
  @article=Article.find(params[:id])
end

end
