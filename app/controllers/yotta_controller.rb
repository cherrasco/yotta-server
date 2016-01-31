class YottaController < ApplicationController
  protect_from_forgery except: :create
  before_action :set_drive, only: :create

  YOTTA_STATE = 2

  def create
    latest_run_information_id = @drive.run_informations.pluck(:id).last
    yottum = Yottum.new(drive_id: @drive.id, run_information_id: latest_run_information_id)
    if yottum.save
      User.find(@drive.user_id).send_notification('Yotta!', @drive.id, YOTTA_STATE)
      render text: @drive.id
    else
      render text: 'cannot create `yottum`'
    end
  end

  private

  def set_drive
    @drive = Drive.find(params[:drive_id])
  end
end
