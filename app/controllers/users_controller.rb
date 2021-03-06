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

    old_user = @user

    if @user.update_attributes(secure_params)

      require 'mixpanel-ruby'
      tracker = Mixpanel::Tracker.new(ENV['MIXPANEL_PROJECT_TOKEN'])
      #tracker.people.set(@user.id, @user.attributes)
      tracker.track(@user.id, 'Updated User', {
        'Old Attributes' => old_user.attributes,
        'New Attributes' => @user.attributes
      })

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
      require 'mixpanel-ruby'
      tracker = Mixpanel::Tracker.new(ENV['MIXPANEL_PROJECT_TOKEN'])
      #tracker.people.set(@user.id, @user.attributes)
      tracker.track(@user.id, 'Promoted User')

      redirect_to @user.company, notice: t('promotion.success')
    else
      redirect_to @user.company, alert: "Unable to promote this user."
    end
  end
  
  def demote
    @user = User.find(params[:user_id])
    authorize @user
    if @user.update_attributes(role: :operator)
      require 'mixpanel-ruby'
      tracker = Mixpanel::Tracker.new(ENV['MIXPANEL_PROJECT_TOKEN'])
      #tracker.people.set(@user.id, @user.attributes)
      tracker.track(@user.id, 'Demoted User')
      
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
