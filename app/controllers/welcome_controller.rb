class WelcomeController < ApplicationController
  def index
  	if organizer_signed_in?
  		redirect_to organizers_index_path
  	elsif participant_signed_in?
  		redirect_to participants_index_path
  	elsif partner_signed_in?
  		redirect_to partners_index_path
  	end
  end
end
