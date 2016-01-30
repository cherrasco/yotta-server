class Drive < ActiveRecord::Base
  belongs_to :user
  has_many :run_information
  has_many :yotta
end
