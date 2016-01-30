class DrivesController < ApiBaseController

  before_action :set_drive, only: :show

  def index
  end

  def show
    respond_to do |format|
      format.json {
        render json: { id: @drive.id, start: @drive.start, end: @drive.end, user_id: @drive.user_id }
      }
    end
  end

  def create
    drive = Drive.new create_params.merge(start: Time.now)
    if drive.save
      render text: drive.id
    else
      render text: 'cannot create `drive`'
    end
  end

  private

  def create_params
    { user_id: 1 }
  end

  def set_drive
    @drive = Drive.find(params[:id])
  end
end
