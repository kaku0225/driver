class DriversController < ApplicationController
  before_action :session_required

  def new
    @driver = Driver.new
  end

  def create
    @driver = current_user.create_driver(params_driver)
    if @driver.save
      current_user.update(role: 'driver')
      redirect_to root_path, notice: '恭喜成為外送員'
    else
      render :new
    end
  end


  private
  def params_driver
    params.require(:driver).permit(:license, :car, :account, :user_id)
  end
end