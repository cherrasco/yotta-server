class User < ActiveRecord::Base
  has_many :drives

  enum type: { driver: 'driver', passenger: 'passenger' }
end
