class InstructionsController < ApplicationController
  before_action :set_instruction, only: [:show, :edit, :update, :destroy]
  before_action :set_product, only: [:new, :create, :index]

  # GET /instructions/1
  # GET /instructions/1.json
  def show
    authorize @instruction
    @product = @instruction.product
  end

  # GET /instructions/new
  def new
    #@instruction = Instruction.new
    @instruction = @product.instructions.build
    authorize @instruction
  end

  # GET /instructions/1/edit
  def edit
  end

  # POST /instructions
  # POST /instructions.json
  def create
    #@instruction = Instruction.new(instruction_params)
    @instruction = @product.instructions.build(instruction_params)

    respond_to do |format|
      if @instruction.save
        format.html { redirect_to @instruction, notice: I18n.t('instructions.create.success') }
        format.json { render :show, status: :created, location: @instruction }
      else
        format.html { render :new }
        format.json { render json: @instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instructions/1
  # PATCH/PUT /instructions/1.json
  def update
    respond_to do |format|
      if @instruction.update(instruction_params)
        format.html { redirect_to @instruction, notice: I18n.t('instructions.update.success') }
        format.json { render :show, status: :ok, location: @instruction }
      else
        format.html { render :edit }
        format.json { render json: @instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructions/1
  # DELETE /instructions/1.json
  def destroy
    @instruction.destroy
    respond_to do |format|
      format.html { redirect_to instructions_url, notice: I18n.t('instructions.destroy.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instruction
      @instruction = Instruction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instruction_params
      params.require(:instruction).permit(:product_id, :language_id)
    end
    
    def set_product
      @product = Product.find(params[:product_id])
    end
end
