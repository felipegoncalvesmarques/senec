class SubscriptionsController < ApplicationController
	before_action :authenticate_participant!, only: [:create, :destroy, :update]

	def create
		@activity = Activity.find(params[:activity_id])
		@subscription = @activity.subscriptions.create(participant: current_participant)
		if @subscription.save
			redirect_to participants_index_path
		else
			render 'new'
		end
	end
	def update
		@subscription = Subscription.find(params[:id])
		@subscription.update(esta_ativo: true)
		redirect_to participants_index_path
	end
	def destroy
		@subscription = Subscription.find(params[:id])
		@subscription.update(esta_ativo: false)
		redirect_to participants_index_path
	end
end
