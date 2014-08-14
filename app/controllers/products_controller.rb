class ProductsController < ApplicationController
  include ProductsHelper

  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:new, :create]
  
  skip_before_filter :authenticate_user!, only: :show
  
  after_action :verify_authorized

  # GET /products/1
  # GET /products/1.json
  def show
    authorize @product
  end

  # GET /products/new
  def new
    @product = @company.products.build
    authorize @product
  end

  # GET /products/1/edit
  def edit
    authorize @product
  end

  # POST /products
  # POST /products.json
  def create
    @product = @company.products.build(product_params)
    authorize @product
    # set the company before saving the product
    set_company
    
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: I18n.t('products.create.success') }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    authorize @product
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: I18n.t('products.update.success') }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    authorize @product
    company = @product.company
    @product.destroy
    respond_to do |format|
      format.html { redirect_to company, notice: I18n.t('products.destroy.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :uuid, :published, :company_id, :user_id)
    end
    
    def set_company
      @company = Company.find(params[:company_id])
    end
end