class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]
  before_action :set_product, only: [:new, :create]

  after_action :verify_authorized

  # GET /notifications
  # GET /notifications.json

  # GET /notifications/1
  # GET /notifications/1.json
  def show
    authorize @notification
  end

  # GET /notifications/new
  def new
    @notification = @product.notifications.build
    authorize @notification
  end

  # GET /notifications/1/edit
  def edit
    authorize @notification
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = @product.notifications.build(notification_params)
    authorize @notification

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification.product, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    authorize @notification
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification.product, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    product = @notification.product
    authorize @notification
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to product, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:content, :category, :product_id, :expiration, :published)
    end
    
    def set_product
      @product = Product.friendly.find(params[:product_id])
    end
end
