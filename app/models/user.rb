class User < ActiveRecord::Base
  has_many :drives

  enum user_type: { driver: 'driver', passenger: 'passenger' }

  def send_notification(alert, drive_id)
    APNS.host = 'gateway.sandbox.push.apple.com'
    APNS.pem = Rails.root.join('config/dev_push.pem')
    APNS.port = 2195
    APNS.send_notification(self.devise_token, alert: alert, badge: 1, sound: 'default', other: { drive_id: drive_id })
    logger.debug("[pushed notification] '#{alert}' (drive_id : #{drive_id}, devise_token : #{self.devise_token})")
  end
end
