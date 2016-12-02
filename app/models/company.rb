# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-13 14:11:58
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-16 18:11:74

class Company < ActiveRecord::Base
  validates :nome, :descricao, :endereco, :logo, :telefone, presence: true, length: { maximum: 45 }
  belongs_to :criado_por, class_name: "Organizer", foreign_key: 'criado_por_id'
  belongs_to :atualizado_por, class_name: "Organizer", foreign_key: 'atualizado_por_id'
  has_many :partners
  has_many :speakers
end
