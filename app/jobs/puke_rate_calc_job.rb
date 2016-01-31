class PukeRateCalcJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    calc(Drive.find(args.last[:drive_id]).run_informations.pluck(:acceleration_z))
  end

  private

  def calc(acceleration_z_arr)
    max_whole_yotta = acceleration_z_arr.length / Math.sqrt( 2 ) / 12.0
    max_recent_yotta = 10 / Math.sqrt( 2 ) / 12.0

    whole_yotta = 0
    recent_yotta = 0

    acceleration_z_arr.reverse.each_with_index do |z, index|
      whole_yotta += z * z
      recent_yotta += z * z if index < 10
    end

    whole_yotta = Math.sqrt(whole_yotta / acceleration_z_arr.length / 3) / max_whole_yotta
    recent_yotta = Math.sqrt(recent_yotta / 10 / 3) / max_recent_yotta

    # whole_yotta = whole_yotta + Yotta.count * 0.1
    redis = Redis.new
    redis.set("whole_yotta", whole_yotta)
    redis.set("recent_yotta", recent_yotta)
  end
end
