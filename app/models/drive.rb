class Drive < ActiveRecord::Base
  belongs_to :user
  has_many :run_informations
  has_many :yotta
end
