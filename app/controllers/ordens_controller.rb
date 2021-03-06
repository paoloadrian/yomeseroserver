class OrdensController < ApplicationController
  before_action :set_orden, only: [:show, :edit, :update, :destroy]

  # GET /ordens
  # GET /ordens.json
  def index
    @ordens = Orden.all
  end

  # GET /ordens/1
  # GET /ordens/1.json
  def show
  end

  # GET /ordens/new
  def new
    @orden = Orden.new
  end

  # GET /ordens/1/edit
  def edit
  end

  # POST /ordens
  # POST /ordens.json
  def create
    @orden = Orden.new(orden_params)
    @orden.name = "Sin nombre"
    @orden.nit = 0

    respond_to do |format|
      if @orden.save
        format.html { redirect_to @orden, notice: 'Orden was successfully created.' }
        format.json { render :show, status: :created, location: @orden }
      else
        format.html { render :new }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordens/1
  # PATCH/PUT /ordens/1.json
  def update
    respond_to do |format|
      if @orden.update(orden_params)
        format.html { redirect_to @orden, notice: 'Orden was successfully updated.' }
        format.json { render :show, status: :ok, location: @orden }
      else
        format.html { render :edit }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordens/1
  # DELETE /ordens/1.json
  def destroy
    @orden.destroy
    respond_to do |format|
      format.html { redirect_to ordens_url, notice: 'Orden was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_from_json
    @orden = Orden.new
    @orden.consumo = params[:consumo].to_f
    @orden.estado = "Pendiente"
    @orden.name = "Sin nombre"
    @orden.nit = 0
    @orden.rest = params[:rest]
    @orden.mesa = params[:mesa]
    @orden.nit = 0
    @orden.name = "Sin nombre"
    if @orden.consumo!="" and @orden.rest!="" and @orden.estado!="" and @orden.mesa!=""
      @orden.save
      render json: @orden
    end
  end

  def update_from_json
    id = params[:id]
    state = params[:state]
    @orden = Orden.find(id)
    @orden.estado = state
    @orden.save
    render json: @orden
  end

  #get all the orders of a restaurant
  def getOrden 
  	@orden = Orden.where(:rest => params[:id_res])
  	render json: @orden
  end

  def getOrdenItems
  	@orden = Orden.find(params[:id])
  	render json: @orden.orden_items
  end

  def billing_data
    @orden = Orden.find(params[:id])
    @orden.name = params[:name]
    if @orden.name != ""
    	@orden.nit = params[:nit]
    else
    	@orden.nit = 0
    	@orden.name = "Sin nombre"
    end
    @orden.save
    render json: @orden
  end

  def pedir_cuenta
    @orden = Orden.find(params[:id])
    @orden.estado = "Por cobrar"
    @orden.save
    render json: @orden
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden
      @orden = Orden.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orden_params
      params.require(:orden).permit(:mesa, :consumo, :rest, :estado, :nit, :name)
    end
end
