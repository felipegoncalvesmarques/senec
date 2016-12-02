# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-16 18:11:95
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-16 19:11:16

class Speaker < ActiveRecord::Base
  validates :nome, :descricao, :telefone, presence: true, length: { maximum: 45 }
  belongs_to :criado_por, class_name: "Organizer", foreign_key: 'criado_por_id'
  belongs_to :atualizado_por, class_name: "Organizer", foreign_key: 'atualizado_por_id'
  belongs_to :company
  has_many :activity_speakers
  has_many :activities, through: :activity_speakers
end
