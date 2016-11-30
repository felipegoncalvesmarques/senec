class ActivitySpeakersController < ApplicationController
	before_action :authenticate_organizer!, only: [:new, :create, :edit, :update, :destroy]

	def new
		@activity = Activity.find(params[:activity_id])
	end
	
	def edit
		@activity_speaker = ActivitySpeaker.find(params[:id])
	end

	def update
		@activity_speaker = ActivitySpeaker.find(params[:id])
		params = activity_speaker_params
		params[:atualizado_por] = current_organizer

		if @activity_speaker.update(params)
			redirect_to '/organizers/index'
		else
			render 'edit'
		end
	end

	def create
		@activity = Activity.find(params[:activity_id])
		params = activity_speaker_params
		params[:criado_por] = current_organizer
		@activity_speaker = @activity.activity_speakers.create(params)
		if @activity_speaker.save
			redirect_to '/organizers/index'
		else
			render 'new'
		end
	end

	def show
		@activity_speaker = ActivitySpeaker.find(params[:id])
	end

	def destroy
		puts params
		@activity = Activity.find(params[:activity_id])
		@activity_speaker = @activity.activity_speakers.find(params[:id])
		@activity_speaker.destroy
		redirect_to '/organizers/index'
	end

	private
	def activity_speaker_params
		params.require(:activity_speaker).permit(:speaker_id)
	end

end
