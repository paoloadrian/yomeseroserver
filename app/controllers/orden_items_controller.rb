class OrdenItemsController < ApplicationController
  before_action :set_orden_item, only: [:show, :edit, :update, :destroy]

  # GET /orden_items
  # GET /orden_items.json
  def index
    @orden_items = OrdenItem.all
  end

  # GET /orden_items/1
  # GET /orden_items/1.json
  def show
  	@item = @orden_item.item
  end

  # GET /orden_items/new
  def new
    @orden_item = OrdenItem.new
  end

  # GET /orden_items/1/edit
  def edit
  end

  # POST /orden_items
  # POST /orden_items.json
  def create
    @orden_item = OrdenItem.new(orden_item_params)
    @orden_item.orden_id = @orden_item.id_orden
    @orden_item.item_id = @orden_item.id_item
    @orden_item.item_name = @orden_item.item.item_name
    @orden_item.item_image = @orden_item.item.item_image

    respond_to do |format|
      if @orden_item.save
        format.html { redirect_to @orden_item, notice: 'Orden item was successfully created.' }
        format.json { render :show, status: :created, location: @orden_item }
      else
        format.html { render :new }
        format.json { render json: @orden_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orden_items/1
  # PATCH/PUT /orden_items/1.json
  def update
    respond_to do |format|
      if @orden_item.update(orden_item_params)
      	@orden_item.orden_id = @orden_item.id_orden
    	@orden_item.item_id = @orden_item.id_item
    	@orden_item.item_name = @orden_item.item.item_name
    	@orden_item.item_image = @orden_item.item.item_image
    	@orden_item.save
        format.html { redirect_to @orden_item, notice: 'Orden item was successfully updated.' }
        format.json { render :show, status: :ok, location: @orden_item }
      else
        format.html { render :edit }
        format.json { render json: @orden_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orden_items/1
  # DELETE /orden_items/1.json
  def destroy
    @orden_item.destroy
    respond_to do |format|
      format.html { redirect_to orden_items_url, notice: 'Orden item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_from_json
    @item = OrdenItem.new
    @item.cantidad = params[:quantity]
    @item.id_orden = params[:pedido]
    @item.id_item = params[:item]
    if @item.cantidad!="" and @item.id_orden!="" and @item.id_item!=""
      @item.item_id = params[:item]
      @item.orden_id = params[:pedido]
      @orden_item.item_name = @orden_item.item.item_name
      @orden_item.item_image = @orden_item.item.item_image
      @item.save
      render json: @item
    else
      render json: 0
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_item
      @orden_item = OrdenItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orden_item_params
      params.require(:orden_item).permit(:cantidad, :id_item, :id_orden)
    end
end
