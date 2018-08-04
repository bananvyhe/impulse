class ResizeimagesController < ApplicationController
  before_action :set_resizeimage, only: [:show, :edit, :update, :destroy,  :crop]

  # GET /resizeimages
  # GET /resizeimages.json
  def index
    @resizeimages = Resizeimage.all
  end

  # GET /resizeimages/1
  # GET /resizeimages/1.json
  def show
  end

  # GET /resizeimages/new
  def new
    @resizeimage = Resizeimage.new
  end

  # GET /resizeimages/1/edit
  def edit
  end

  # POST /resizeimages
  # POST /resizeimages.json
  def create
    @resizeimage = Resizeimage.new(resizeimage_params)

    respond_to do |format|
      if @resizeimage.save
         if resizeimage_params[:file].present?
          format.html { render :crop, notice: 'Картинка добавлена в библиотеку' }
        else
          format.html { redirect_to action: :index, notice: 'Картинка добавлена в библиотеку.' }
        end  
        format.json { render :show, status: :created, location: @resizeimage }
      else
        format.html { render :new }
        format.json { render json: @resizeimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resizeimages/1
  # PATCH/PUT /resizeimages/1.json
  def update
    respond_to do |format|
      if @resizeimage.update(resizeimage_params)
        format.html { redirect_to @resizeimage, notice: 'Resizeimage was successfully updated.' }
        format.json { render :show, status: :ok, location: @resizeimage }
      else
        format.html { render :crop}
        format.json { render json: @resizeimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resizeimages/1
  # DELETE /resizeimages/1.json
  def destroy
    @resizeimage.destroy
    respond_to do |format|
      format.html { redirect_to resizeimages_url, notice: 'Resizeimage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resizeimage
      @resizeimage = Resizeimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resizeimage_params
      params.require(:resizeimage).permit(:file,   :file_cache, :remove_file, :crop_x, :crop_y, :crop_w, :crop_h)
    end
end
