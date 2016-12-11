class PresencesController < ApplicationController
	before_action :authenticate_organizer!, only: [:new, :show, :destroy]
	protect_from_forgery except: :create
	def new
		@activity = Activity.find(params[:activity_id])
	end

	def create
		@activity = Activity.find(params[:activity_id])
		@participant = Participant.find(params[:presence][:participant_id])
		if not(@activity.attendees.include?(@participant))
			@presence = @activity.presences.create(presence_param)
			if @presence.save
				redirect_to organizers_index_path
			else
				render 'new'
			end
		else
			render 'new'
		end
	end

	def destroy
		@presence = Presence.find(params[:id])
		if @presence.destroy
			redirect_to organizers_index_path
		else
			redirect_to @presence
		end
	end

	private
	def presence_param
		params.require('presence').permit(:participant_id)
	end
end
