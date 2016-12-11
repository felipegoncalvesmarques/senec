# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-17 18:11:35
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-17 19:11:37

class Activity < ActiveRecord::Base
  validates :titulo, :descricao, :local, presence: true, length: { maximum: 45 }
  validates :numero_de_vagas, :data_limite_de_inscricao, presence: true
  belongs_to :criado_por, class_name: "Organizer", foreign_key: 'criado_por_id'
  belongs_to :atualizado_por, class_name: "Organizer", foreign_key: 'atualizado_por_id'
  has_many :activity_speakers
  has_many :subscriptions
  has_many :presences
  has_many :feedbacks
  has_many :participants, through: :feedbacks
  has_many :speakers, through: :activity_speakers
  has_many :subscribers, through: :subscriptions, source: :participant
  has_many :attendees, through: :presences, source: :participant

  def subscriable?
    if self.subscriptions.where(esta_ativo: true).count >= self.numero_de_vagas
      return false
    else
      if self.data_limite_de_inscricao < Date.today
        return false
      else
        return true
      end
    end
  end

  def subscribed?(subscriber)
    if self.subscribers.include?(subscriber)
      return true
    else
      return false
    end
  end

  def gave_feedback?(participant)
    if self.participants.include?(participant)
      return true
    else
      return false
    end
  end

  def count_subscribers
    return self.subscriptions.where(esta_ativo: true).count()
  end

  def data_horario_format
    data_horario.strftime("%Y-%m-%d %H:%M:%S")
  end
  
  def as_json(options={})
    json = super(only: [:id, :titulo, :descricao, :local, :numero_de_vagas])
    json[:data_horario] = data_horario_format
    json[:inscritos] = subscribers.order(:nome).as_json()
    json[:presentes] = attendees.order(:nome).as_json()
    json
  end
end
