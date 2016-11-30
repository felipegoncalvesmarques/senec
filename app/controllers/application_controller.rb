class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
  	puts "Resource: #{resource}"
  	if resource.is_a?(Organizer)
  		return organizers_index_path
  	elsif resource.is_a?(Participant)
  		return participants_index_path
  	elsif resource.is_a?(Partner)
      return partners_index_path
    else
  		return root_path
  	end
  end
end
