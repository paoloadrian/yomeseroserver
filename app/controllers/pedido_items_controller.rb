class PedidoItemsController < ApplicationController
  before_action :set_pedido_item, only: [:show, :edit, :update, :destroy]

  # GET /pedido_items
  # GET /pedido_items.json
  def index
    @pedido_items = pedidoItem.all
  end

  # GET /pedido_items/1
  # GET /pedido_items/1.json
  def show
  end

  # GET /pedido_items/new
  def new
    @pedido_item = PedidoItem.new
  end

  # GET /pedido_items/1/edit
  def edit
  end

  # POST /pedido_items
  # POST /pedido_items.json
  def create
    @pedido_item = PedidoItem.new(pedido_item_params)

    respond_to do |format|
      if @pedido_item.save
        format.html { redirect_to @pedido_item, notice: 'pedido item was successfully created.' }
        format.json { render :show, status: :created, location: @pedido_item }
      else
        format.html { render :new }
        format.json { render json: @pedido_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedido_items/1
  # PATCH/PUT /pedido_items/1.json
  def update
    respond_to do |format|
      if @pedido_item.update(pedido_item_params)
        format.html { redirect_to @pedido_item, notice: 'pedido item was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido_item }
      else
        format.html { render :edit }
        format.json { render json: @pedido_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedido_items/1
  # DELETE /pedido_items/1.json
  def destroy
    @pedido_item.destroy
    respond_to do |format|
      format.html { redirect_to pedido_items_url, notice: 'pedido item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_from_json
    @item = PedidoItem.new
    @item.quantity = params[:quantity]
    @item.pedido_id = params[:pedido]
    @item.item_id = params[:item]
    if @item.quantity!="" and @item.pedido_id!="" and @item.item_id!=""
      @item.save
      render json: @item
    else
      render json: 0
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido_item
      @pedido_item = PedidoItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_item_params
      params.require(:pedido_item).permit(:quantity, :pedido_id, :item_id)
    end
end
