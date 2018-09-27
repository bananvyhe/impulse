class KatbibsController < ApplicationController
	
  before_action :set_katbib, only: [:show, :edit, :update, :destroy]
   
  # GET /contacts
  # GET /contacts.json
  def index
    @katbibs = Кatbib.sorted
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @katbib = Katbib.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @katbib = Katbib.new(katbib_params)

    respond_to do |format|
      if @katbib.save
        format.html { redirect_to @katbib, notice: 'katbib was successfully created.' }
        format.json { render :show, status: :created, location: @katbib }
      else
        format.html { render :new }
        format.json { render json: @katbib.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /katbibs/1
  # PATCH/PUT /katbibs/1.json
  def update
    respond_to do |format|
      if @katbib.update(katbib_params)
       format.html { redirect_to action: :index, notice: 'Публикация добавлена.' }
        format.json { render :show, status: :ok, location: @katbib }
      else
        format.html { render :edit }
        format.json { render json: @katbib.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @katbib.destroy
    respond_to do |format|
      format.html { redirect_to katbibs_url, notice: 'katbib was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_katbib
      @katbib = Katbib.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def katbib_params
      params.require(:katbib).permit(:name, :position)
    end


end
