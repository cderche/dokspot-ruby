class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_instruction, only: [:new, :create, :index]
  
  skip_before_filter :authenticate_user!, except: :index

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    if !user_signed_in?
      #puts "Target: #{params[:code]}, Actual: #{@order.code}"
      if params[:code] != @order.code
        flash[:error] = I18n.t("orders.invalid_code")
        redirect_to root_path
      end
    end
    authorize @order
  end

  # GET /orders/new
  def new
    @order = @instruction.orders.build
    @order.customer = Customer.new
  end

  # GET /orders/1/edit
  def edit
    if !user_signed_in?
      puts "Order Status: #{@order.status}"
      puts "New Order: #{:new_order}"
      if @order.status != 'new_order'
        redirect_to order_path(@order, code: @order.code), notice: I18n.t('orders.already_processed')
      end
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order = @instruction.orders.build(order_params)
    @order.customer.reason = :order

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: I18n.t('orders.create.success') }
        format.json { render :show, status: :created, location: @order }
      else
        puts @order.errors.full_messages
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    confirming_order = order_params[:reviewed]
    
    message = I18n.t('orders.update.success')
    if confirming_order
      message = I18n.t('orders.reviewed.success')
    else
      # send_user_email_modified_order
      # send_order_manager_email_modified_order
    end
    
    puts "STATUS: #{order_params[:status]}"
    if order_params[:status] == 'cancelled'
      message = t('orders.cancelled')
    end
    
    if @order.update(order_params)
      if confirming_order
        confirm_order
        redirect_to @order.instruction.product, notice: message
      elsif order_params[:status] == 'cancelled'
        puts "I am confirming the order cancellation"
        confirm_cancel
        if user_signed_in?
          redirect_to @order, notice: message
        else
          redirect_to order_path(@order, code: @order.code), notice: message
        end
      else
        redirect_to order_path(@order, code: @order.code), notice: 'Order Updated.'
      end
    else
      render :edit
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def confirm
    @order = Order.friendly.find(params[:order_id])
    @order.reviewed = true
    @order.save
    redirect_to @order.instruction, notice: 'Order successfully created'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = I18n.t("orders.not_found", token: params[:id])
      redirect_to root_path
    end
    
    def set_instruction
      @instruction = Instruction.find(params[:instruction_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:instruction_id, :reviewed, :code, :status, :track, customer_attributes: [:full_name, :company, :address1, :address2, :postcode, :city, :country, :notes, :telephone, :email])
    end
    
    def confirm_order
      Thread.new do
        puts "I'm in a thread!"
        @order.code = SecureRandom.hex(2)
        @order.save
        CustomerMailer.new_order(@order).deliver
        CompanyMailer.new_order(@order).deliver
        puts "I'm leaving the thread!"
      end
    end
    
    def confirm_cancel
      Thread.new do
        puts "I'm sending an email to cancel the order"
        CustomerMailer.cancelled_order(@order).deliver
        CompanyMailer.cancelled_order(@order).deliver
        puts "I have finised sending the order cancellation emails!"
      end
    end
end
