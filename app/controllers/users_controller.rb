class UsersController < ApplicationController
  #before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def show
    puts "Hello World"
    authorize @user
    if current_user.admin?
      redirect_to @user.company
    else
      redirect_to current_user.company
    end
  end
  
  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to @user.company, notice: t('devise.registrations.updated')
    else
      redirect_to @user.company, :alert => "Unable to update user."
    end
  end

  def destroy
    authorize @user
    company = @user.company
    @user.destroy
    redirect_to company, :notice => "User deleted."
  end

  def promote
    @user = User.find(params[:user_id])
    authorize @user
    if @user.update_attributes(role: :manager)
      redirect_to @user.company, notice: t('promotion.success')
    else
      redirect_to @user.company, alert: "Unable to promote this user."
    end
  end
  
  def demote
    @user = User.find(params[:user_id])
    authorize @user
    if @user.update_attributes(role: :operator)
      redirect_to @user.company, notice: t('demotion.success')
    else
      redirect_to @user.company, alert: "Unable to update user."
    end
  end
    
  
  private

  def secure_params
    params.require(:user).permit(:role)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

end
