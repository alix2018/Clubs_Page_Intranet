  class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 2).order("created_at desc")
    @articles_np = Article.where('is_private' => false).paginate(:page => params[:page], :per_page => 15)
    @events = Event.paginate(:page => params[:page], :per_page => 10).order("created_at desc")
    @events_np =Event.where('is_private' => false).paginate(:page => params[:page], :per_page => 15)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  def list_private
    @articles = Article.paginate(:page => params[:page], :per_page => 15)
    @articles_private = current_user.articles
    render "index"
  end

  # GET /articles/new
  def new
    @article = Article.new
    @club = Club.all
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to articles_path
      flash[:notice] = "L'article a été créé. Congratulations!!!"
    else
      render :new
      flash[:error] = "L'article n'a pas été créé."

    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :is_private, :club_id)
    end
end