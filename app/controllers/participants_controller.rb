class ParticipantsController < ApplicationController
	before_action :authenticate_participant!, only: [:index]
	def index
		@participant = current_participant
		@activities = []
		(2..6).each do |i|
			day_activities = Activity.where("DAYOFWEEK(data_horario)=#{i}").order(:data_horario)
			@activities << day_activities
		end
	end
end
