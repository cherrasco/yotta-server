class RunInformationsController < ApiBaseController
  protect_from_forgery except: :bulk_create
  before_action :set_redis, only: :analysis

  def index
    @run_informations = RunInformation.select(:id, :latitude, :longitude).where(drive_id: params[:drive_id])
    @yotta_run_informations = @run_informations.select { |ri| ri.yotta.present? }
    @count_yotta = @yotta_run_informations.size

    render formats: :json, handlers: :jbuilder
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

    PukeRateCalcJob.perform_later drive_id: params[:drive_id]

    render text: 'success'
  end

  def analysis
    # とりあえずランダムな値入れる
    @redis.set('whole_yotta', rand)
    @redis.set('recent_yotta', rand)

    @whole_yotta = @redis.get(:whole_yotta).to_f
    @recent_yotta = @redis.get(:recent_yotta).to_f

    render formats: :json, handlers: :jbuilder
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

  def set_redis
    redis_config = YAML.load_file(Rails.root.join('config/redis.yml'))[Rails.env].symbolize_keys
    @redis = Redis.new(redis_config)
  end

end
