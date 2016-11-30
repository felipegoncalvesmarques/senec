class ActivitySpeaker < ActiveRecord::Base
	belongs_to :activity
	belongs_to :speaker
	belongs_to :criado_por, class_name: "Organizer", foreign_key: 'criado_por_id'
  	belongs_to :atualizado_por, class_name: "Organizer", foreign_key: 'atualizado_por_id'
end
