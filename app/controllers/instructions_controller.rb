require 'open-uri'

class InstructionsController < ApplicationController
  before_action :set_instruction, only: [:show, :edit, :update, :destroy]
  before_action :set_product, only: [:new, :create, :index]
  after_action :verify_authorized

  skip_before_filter :authenticate_user!, only: [:show, :primary]

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
    @instruction.documents.build
    authorize @instruction
    @languages = Language.all - @product.languages
  end

  # GET /instructions/1/edit
  def edit
    authorize @instruction
    @languages = Language.all - @instruction.product.languages #+ @instruction.language
    @languages << @instruction.language
  end

  # POST /instructions
  # POST /instructions.json
  def create
    @languages = Language.all - @product.languages
    
    #@instruction = Instruction.new(instruction_params)
    @instruction = @product.instructions.build(instruction_params)
    authorize @instruction

    respond_to do |format|
      if @instruction.save

        require 'mixpanel-ruby'
        tracker = Mixpanel::Tracker.new(ENV['MIXPANEL_PROJECT_TOKEN'])
        tracker.track(current_user.id, 'Instruction Create', @instruction.attributes)

        format.html { redirect_to @instruction.product, notice: I18n.t('instructions.create.success') }
        format.json { render :show, status: :created, location: @instruction }
      else

        require 'mixpanel-ruby'
        tracker = Mixpanel::Tracker.new(ENV['MIXPANEL_PROJECT_TOKEN'])
        tracker.track(current_user.id, 'Instruction Create Failed', @instruction.attributes)

        format.html { render :new }
        format.json { render json: @instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instructions/1
  # PATCH/PUT /instructions/1.json
  def update
    authorize @instruction
    respond_to do |format|
      if @instruction.update(instruction_params)

        require 'mixpanel-ruby'
        tracker = Mixpanel::Tracker.new(ENV['MIXPANEL_PROJECT_TOKEN'])
        tracker.track(current_user.id, 'Instruction Update', @instruction.attributes)

        format.html { redirect_to @instruction.product, notice: I18n.t('instructions.update.success') }
        format.json { render :show, status: :ok, location: @instruction }
      else

        require 'mixpanel-ruby'
        tracker = Mixpanel::Tracker.new(ENV['MIXPANEL_PROJECT_TOKEN'])
        tracker.track(current_user.id, 'Instruction Update Failed', @instruction.attributes)

        format.html { render :edit }
        format.json { render json: @instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructions/1
  # DELETE /instructions/1.json
  def destroy
    authorize @instruction
    product = @instruction.product

    require 'mixpanel-ruby'
    tracker = Mixpanel::Tracker.new(ENV['MIXPANEL_PROJECT_TOKEN'])
    tracker.track(current_user.id, 'Instruction Delete', @instruction.attributes)

    @instruction.destroy
    respond_to do |format|
      format.html { redirect_to product, notice: I18n.t('instructions.destroy.success') }
      format.json { head :no_content }
    end
  end
  
  def primary
    @instruction = Instruction.find(params[:instruction_id])
    @document = @instruction.primary
    authorize @document
    #@document.download
    data = open(@document.file.url)
    send_data data.read, filename: @document.fileName, type: 'application/pdf', disposition: :attachment, stream: true, buffer_size: 4096

    require 'mixpanel-ruby'
    tracker = Mixpanel::Tracker.new(ENV['MIXPANEL_PROJECT_TOKEN'])

    user_id = 0
    user_id = current_user.id if user_signed_in?

    tracker.track(user_id, 'Document Open', {
      product_id: @instruction.product.id,
      product_uuid: @instruction.product.uuid,
      language: @instruction.language.name,
      version: @document.version,
      url: @document.file.url
    })
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instruction
      @instruction = Instruction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instruction_params
      params.require(:instruction).permit(:product_id, :language_id, :published, :category, documents_attributes: [:version, :file, :primary])
    end
    
    def set_product
      @product = Product.friendly.find(params[:product_id])
    end
end
