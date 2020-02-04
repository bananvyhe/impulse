class SlidersController < ApplicationController
  before_action :set_slider, only: [:show, :edit, :update, :destroy, :crop]

  # GET /sliders
  # GET /sliders.json
  def index
    @sliders = Slider.all
  end

  # GET /sliders/1
  # GET /sliders/1.json
  def show
  end

  # GET /sliders/new
  def new
    @slider = Slider.new
  end

  # GET /sliders/1/edit
  def edit
  end

  # POST /sliders
  # POST /sliders.json
  def create
    # request.format = :json
    @slider = Slider.new(slider_params) 
    print '----------!!!-----------'
    print slider_params 
       print '----------!!!-----------'
    if slider_params[:slidetube] != ""
      ssil = slider_params[:slidetube] 
      @slider.ssilka = slider_params[:slidetube]
      # @slider.save

      respond_to do |format|
        if @slider.save
          format.html { render :new }
          format.json { render :index, status: :created, location: @slider }
        else
          format.html { render :new }
          format.json { render json: @slider.errors, status: :unprocessable_entity }
        end
      end
    else

      respond_to do |format|
        if @slider.save
          format.html { render :crop, notice: 'Создано.' }
          format.json { render :index, status: :created, location: @slider }
        else
          format.html { render :new }
          format.json { render json: @slider.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /sliders/1
  # PATCH/PUT /sliders/1.json
  def update
    respond_to do |format|
      if @slider.update(slider_params)
        format.html { redirect_to action: :index, notice: 'Обновлено.' }
        format.json { render :index, status: :ok, location: @slider }
      else
        format.html { render :crop }
        format.json { render json: @slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sliders/1
  # DELETE /sliders/1.json
  def destroy
    @slider.destroy
    respond_to do |format|
      format.html { redirect_to sliders_url, notice: 'Удалено.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slider
      @slider = Slider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slider_params
      params.require(:slider).permit(:slidetube, :slide_cache, :slide, :caption1, :caption2, :slider, :ssilka, :slider_cache, :remove_slider, :crop_x, :crop_y, :crop_w, :crop_h)
    end
end
