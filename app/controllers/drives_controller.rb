class DrivesController < ApiBaseController

  before_action :set_drive, only: [:show, :update]

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
      User.find(drive.user_id).send_notification('運転を開始してください', drive.id)
      render text: drive.id
    else
      render text: 'cannot create `drive`'
    end
  end

  def update
    @drive.end = Time.now
    if @drive.save
      # TODO: 詳細表示に必要な項目をpushする
      User.find(@drive.user_id).send_notification('あなたの運転の詳細です', @drive.id)
      render text: @drive.id
    else
      render text: 'cannot update `drive`'
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
