class PukeRateCalcJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    redis = Redis.new
    p args.last[:user_id]
    p args.last[:drive_id]
    redis.set("whole_yotta", rand)
    redis.set("recent_yotta", rand)
  end
end
