class User < ActiveRecord::Base
  has_many :drives

  enum user_type: { driver: 'driver', passenger: 'passenger' }
end
