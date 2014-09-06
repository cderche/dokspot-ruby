class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /companies
  # GET /companies.json
  def index
    authorize Company
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    authorize @company
  end

  # GET /companies/new
  def new
    authorize Company
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    authorize @company
  end

  # POST /companies
  # POST /companies.json
  def create
    authorize Company
    @company = Company.new(company_params)
    @company.symbol = @company.symbol.upcase
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: I18n.t('companies.success') }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    authorize @company
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: I18n.t('companies.updated') }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    authorize @company
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: I18n.t('companies.destroy.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.friendly.find(params[:id])
      authorize @company
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :symbol, :website, :contact, :order_email)
    end
end
