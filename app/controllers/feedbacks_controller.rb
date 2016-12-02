class FeedbacksController < ApplicationController
	before_action :authenticate_participant!, only: [:create, :new]

	def new
		@activity = Activity.find(params[:activity_id])
		@feedback = Feedback.new
	end
	
	def create
		@activity = Activity.find(params[:activity_id])
		params = feedback_params
		params['participant'] = current_participant
		@feedback = @activity.feedbacks.create(params)
		if @feedback.save
			redirect_to '/participants/index'
		else
			render 'new'
		end
	end
	
	def show
		@feedback = Feedback.find(params[:id])
	end

	private
	def feedback_params
		params.require(:feedback).permit(:pontos_positivos, :pontos_negativos, :nota)
	end
end
