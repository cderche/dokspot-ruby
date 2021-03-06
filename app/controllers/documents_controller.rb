require 'open-uri'

class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :set_instruction, except: [:show, :edit, :update, :destroy, :download, :make_primary] #only: [:new, :create, :index]

  skip_before_filter :authenticate_user!, only: :download

  # GET /documents
  # GET /documents.json
  def index
    authorize Document
  end

  # GET /documents/1
  # GET /documents/1.json
  #def show
  #end

  # GET /documents/new
  def new
    @document = @instruction.documents.build
    authorize @document
  end

  # GET /documents/1/edit
  def edit
    authorize @document
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = @instruction.documents.build(document_params)
    authorize @document
    disable_primary if @document.primary
    respond_to do |format|
      if @document.save
        format.html { redirect_to @instruction, notice: t('documents.create.success') }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json

  def update
    authorize @document
    disable_primary if document_params[:primary]
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document.instruction, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    authorize @document
    instruction = @document.instruction
    @document.destroy
    respond_to do |format|
      format.html { redirect_to instruction, notice: t('documents.destroy.success') }
      format.json { head :no_content }
    end
  end

  def download
    @document = Document.find(params[:document_id])
    authorize @document
    #@document.download
    # data = open(@document.file.url)
    # send_data data.read, filename: @document.fileName, type: 'application/pdf', disposition: :attachment, stream: true, buffer_size: 4096

    require 'mixpanel-ruby'
    tracker = Mixpanel::Tracker.new(ENV['MIXPANEL_PROJECT_TOKEN'])

    user_id = 0
    user_id = current_user.id if user_signed_in?

    tracker.track(user_id, 'Document Open', {
      product_id: @document.instruction.product.id,
      product_uuid: @document.instruction.product.uuid,
      language: @document.instruction.language.name,
      version: @document.version,
      url: @document.file.url
    })

    data = open(@document.file.url)
    send_data data.read, filename: @document.fileName, type: 'application/pdf'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:comment, :file, :version, :primary)
    end

    def set_instruction
      @instruction = Instruction.find(params[:instruction_id])
    end

    def disable_primary
      instruction = @document.instruction
      instruction.documents.each do |document|
        if document != @document
          document.primary = false
          document.save
        end
      end
    end
end
