class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy, :crop]

  # GET /news
  # GET /news.json
  def index
    @news = News.all.order(created_at: :desc)
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)

    respond_to do |format|
      if @news.save
          
            format.html { render :crop, notice: 'Новость добавлена.' }
             
              format.html { render :index, notice: 'Новость добавлена.' }
             
         
        format.json { render :index, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to action: :index, notice: 'Новость обновлена.' }
        format.json { render :index, status: :ok, location: @news }
      else
        format.html { render :crop }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'Ноыость удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:image, :desc, :newspic, :newspic_cache, :remove_newspic, :crop_x, :crop_y, :crop_w, :crop_h, :per_page, :current_page)
    end
end
