class RunInformation < ActiveRecord::Base
  belongs_to :drive
  has_many :yotta
end
