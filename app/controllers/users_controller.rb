class UsersController < ApplicationController
  #before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def show
    authorize @user
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
    @user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def promote
    authorize @user
    if @user.update_attributes(role: :manager)
      redirect_to @user.company, notice: t('devise.registrations.updated')
    else
      redirect_to @user.company, :alert => "Unable to update user."
    end
  end
  
  def demote
    authorize @user
    if @user.update_attributes(role: :operator)
      redirect_to @user.company, notice: t('devise.registrations.updated')
    else
      redirect_to @user.company, :alert => "Unable to update user."
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
