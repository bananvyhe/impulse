class LibrariesController < ApplicationController
  before_action :set_library, only: [:show, :edit, :update, :destroy, :crop]

  # GET /libraries
  # GET /libraries.json
  def index
    @libraries = Library.all.order(created_at: :desc)
  end

  # GET /libraries/1
  # GET /libraries/1.json
  def show
  end

  # GET /libraries/new
  def new
    @library = Library.new
  end

  # GET /libraries/1/edit
  def edit
  end

  # POST /libraries
  # POST /libraries.json
  def create
    @library = Library.new(library_params)

    respond_to do |format|
      if @library.save
        if library_params[:cover].present?
          format.html { render :crop, notice: 'Публикация добавлена.' }
        else
          format.html { redirect_to action: :index, notice: 'Публикация добавлена.' }
        end  
          format.json { render :index, status: :created, location: @library }  
      else
        format.html { redirect_to @library }
         format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libraries/1
  # PATCH/PUT /libraries/1.json
  def update
    respond_to do |format|
      if @library.update(library_params)
        format.html { redirect_to action: :index, notice: 'Публикация обновлена.' }
        format.json { render :index, status: :ok, location: @library }
      else
        format.html { render :crop }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libraries/1
  # DELETE /libraries/1.json
  def destroy
    @library.destroy
    respond_to do |format|
      format.html { redirect_to libraries_url, notice: 'Публикация удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library
      @library = Library.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def library_params
      params.require(:library).permit(:name, :cover, :cover_cache, :remove_cover, :desc, :file, :file_cache, :remove_file, :crop_x, :crop_y, :crop_w, :crop_h, :position, :katbib2_id)
    end
end
