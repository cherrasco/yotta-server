class RunInformationsController < ApiBaseController
  def index
  end

  def show
  end

  def create
  end

  def bulk_create
    run_informations = []
    bulk_create_params.each do |create_params|
      run_informations << RunInformation.new(create_params.merge(drive_id: params[:drive_id]))
    end
    RunInformation.import run_informations
    
    render text: 'success'
  end

  private

  def bulk_create_params
    strong_params = []
    params.require(:run_informations).each do |p|
      strong_params << p.permit(:vehicle_speed, :engine_speed, :acceleration_x, :acceleration_y,
                                :acceleration_z, :gyro_x, :gyro_y, :gyro_z, :steering_wheel,
                                :latitude, :longitude, :altitude, :gps_heading, :gps_speed)
    end
    strong_params
  end
end
