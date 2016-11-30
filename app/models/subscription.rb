class Subscription < ActiveRecord::Base
	belongs_to :activity
	belongs_to :participant
end
