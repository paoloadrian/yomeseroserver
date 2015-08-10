class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.restaurant_id = params[:item][:restaurant_id]

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_from_json
    @item = Item.new
    @item.item_name = params[:item_name]
    @item.item_description = params[:item_description]
    @item.item_type = params[:item_type]
    @item.item_time = params[:item_time]
    @item.item_price = params[:item_price]
    @item.restaurant_id = params[:restaurant_id]
    @item.item_image = params[:item_image].gsub("_","+")
    if @item.item_name!="" and @item.item_description!="" and @item.item_type!="" and @item.item_price!="" and @item.item_time!=""
      @item.save
    end
    redirect_to @item
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
      	@item.orden_items.each do |orden_item|
      		orden_item.item_name = @item.item_name
      		orden_item.item_image = @item.item_image
      		orden_item.item_type = @item.item_type
      		orden_item.save
      	end
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def verify_password
    @user = params[:username]
    @pass = params[:password]
    @u = User.where(:email => @user).first
    if @u!=nil
          if @u.valid_password?(@pass) and @u.rest==nil
            render json: @u
          else
            @u = User.new
            render json: @u
          end
    else
      @u = User.new
      render json: @u
    end
  end

  def verify_restaurant_password
    @user = params[:username]
    @pass = params[:password]
    @u = User.where(:email => @user).first
    if @u!=nil
          if @u.valid_password?(@pass) and @u.rest!=nil
            render json: @u
          else
            @u = User.new
            render json: @u
          end
    else
      @u = User.new
      render json: @u
    end
  end

  def register_user
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    @user.save
    render json: @user
  end

  def create_user_json
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    @user.rest = params[:rest]
    @user.save
    render json: @user
  end

  def get_users
    @users = User.all
    render json: @users
  end

  def get_user
    @user = User.(params[:id])
    render json: @user
  end

  def facturation_data
    @user = User.find(params[:id])
    @user.nit = params[:nit]
    @user.name = params[:name]
    @user.save
    render json: @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:item_name, :item_description, :item_type, :item_time, :item_price, :item_image, :restaurant_id)
    end
end
