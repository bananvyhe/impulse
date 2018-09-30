class Katbib2sController < ApplicationController
  before_action :set_katbib2, only: [:show, :edit, :update, :destroy, :move]

  # GET /katbib2s
  # GET /katbib2s.json
  def index
    @katbib2s = Katbib2.sorted
  end

  # GET /katbib2s/1
  # GET /katbib2s/1.json
  def show
  end

  # GET /katbib2s/new
  def new
    @katbib2 = Katbib2.new
  end

  # GET /katbib2s/1/edit
  def edit
  end

  # POST /katbib2s
  # POST /katbib2s.json
  def create
    @katbib2 = Katbib2.new(katbib2_params)

    respond_to do |format|
      if @katbib2.save
        format.html {redirect_to :action => 'index', notice: 'Категория успешно создана.' }
        format.json { render :index, status: :created  }
      else
        format.html { render :new }
        format.json { render json: @katbib2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /katbib2s/1
  # PATCH/PUT /katbib2s/1.json
  def update
    respond_to do |format|
      if @katbib2.update(katbib2_params)
        format.html { redirect_to @katbib2, notice: 'Katbib2 was successfully updated.' }
        # format.json { render :show, status: :ok, location: @katbib2 }
      else
        format.html { render :edit }
        format.json { render json: @katbib2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /katbib2s/1
  # DELETE /katbib2s/1.json
  def destroy
    @katbib2.destroy
    respond_to do |format|
      format.html { redirect_to katbib2s_url, notice: 'Katbib2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def move
    # if (current_user.admin? || current_user.superadmin?)
      @katbib2.insert_at(katbib2_params[:position].to_i)
      render action: :show
    # end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_katbib2
      @katbib2 = Katbib2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def katbib2_params
      params.require(:katbib2).permit(:position, :name)
    end
end
