class PartnersController < ApplicationController
	before_action :authenticate_partner!, only: [:index]

	def index
		@partner = current_partner
		@activities = []
		@partner.company.speakers.order(:nome).each do |speaker|
			speaker.activities.order(:nome).each do |activity|
				@activities << activity unless @activities.include?(activity)
			end
		end
	end
end
