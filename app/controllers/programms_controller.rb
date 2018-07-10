class ProgrammsController < ApplicationController
  before_action :set_programm, only: [:show, :edit, :update, :destroy]

  # GET /programms
  # GET /programms.json
  def index
    @programms = Programm.all.order(created_at: :asc)
  end

  # GET /programms/1
  # GET /programms/1.json
  def show
  end

  # GET /programms/new
  def new
    @programm = Programm.new
  end

  # GET /programms/1/edit
  def edit
  end

  # POST /programms
  # POST /programms.json
  def create
    @programm = Programm.new(programm_params)

    respond_to do |format|
      if @programm.save
        format.html { redirect_to action: :index, notice: 'Programm was successfully created.' }
        format.json { render :index, status: :created, location: @programm }
      else
        format.html { render :new }
        format.json { render json: @programm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programms/1
  # PATCH/PUT /programms/1.json
  def update
    respond_to do |format|
      if @programm.update(programm_params)
        format.html { redirect_to action: :index, notice: 'Programm was successfully updated.' }
        format.json { render :index, status: :ok, location: @programm }
      else
        format.html { render :edit }
        format.json { render json: @programm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programms/1
  # DELETE /programms/1.json
  def destroy
    @programm.destroy
    respond_to do |format|
      format.html { redirect_to programms_url, notice: 'Programm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_programm
      @programm = Programm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def programm_params
      params.require(:programm).permit(:name, :desc, :cat, :visible )
    end
end
