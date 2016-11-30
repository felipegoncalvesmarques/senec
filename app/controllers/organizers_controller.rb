class OrganizersController < ApplicationController
	before_action :authenticate_organizer!, only: [:index]
	def index
		@organizer = current_organizer
		@companies = Company.where(esta_ativo: true).order(:nome)
		@activities = Activity.where(esta_ativo: true).order(:data_horario)
		@participants = Participant.where(esta_ativo: true).order(:nome)
	end
end
