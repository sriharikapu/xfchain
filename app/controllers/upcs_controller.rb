class UpcsController < ApplicationController
  before_action :set_upc, only: [:show, :edit, :update, :destroy]

  # GET /upcs
  # GET /upcs.json

  def wallet
    render layout: false
  end

  def register
    upc_id = params[:upcId]
    product_id = params[:productId]
    wallet_address = params[:walletAddress]
    @upc = Upc.where(name: upc_id.downcase).first
    @product = @upc.products.where(public_id: product_id).first

    if @product && @product.wallet_key.blank?
      @product.update_attributes(wallet_key: wallet_address)
    end

    respond_to do |format|
      format.json { render :register, status: :created, location: @product }
    end
  end

  def home
  end

  def index
    @upcs = Upc.all
  end

  # GET /upcs/1
  # GET /upcs/1.json
  def show
  end

  def upload_products
    @upc = Upc.find(upc_params[:upc_id])
  end

  def import
    if params[:file].present?
      @upc = Upc.find(upc_params[:upc_id])
      data = params[:file].read
      @upc.import(data)
    end
  end

  # GET /upcs/new
  def new
    @upc = Upc.new
  end

  # GET /upcs/1/edit
  def edit
  end

  # POST /upcs
  # POST /upcs.json
  def create
    @upc = Upc.new(upc_params)

    respond_to do |format|
      if @upc.save
        format.html { redirect_to @upc, notice: 'Upc was successfully created.' }
        format.json { render :show, status: :created, location: @upc }
      else
        format.html { render :new }
        format.json { render json: @upc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /upcs/1
  # PATCH/PUT /upcs/1.json
  def update
    respond_to do |format|
      if @upc.update(upc_params)
        format.html { redirect_to @upc, notice: 'Upc was successfully updated.' }
        format.json { render :show, status: :ok, location: @upc }
      else
        format.html { render :edit }
        format.json { render json: @upc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upcs/1
  # DELETE /upcs/1.json
  def destroy
    @upc.destroy
    respond_to do |format|
      format.html { redirect_to upcs_url, notice: 'Upc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upc
      @upc = Upc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upc_params
      params.permit(:name, :upc_id, :file)
    end
end
