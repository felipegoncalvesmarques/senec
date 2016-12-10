# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-12 09:11:24
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-12 17:11:91

class Participant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :nome, :telefone, :instituto, :curso, presence: true, length: { maximum: 45}
  validates :ano, presence: true
  has_many :subscriptions
  has_many :presences
  has_many :feedbacks
  has_many :activities, through: :feedbacks
  has_many :activities, through: :subscriptions
  has_many :activities, through: :presences
  def active_for_authentication?
    # Uncomment the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml
    super && self.esta_ativo
  end

  def inactive_message
    self.esta_ativo ? super : 'Conta desativada, mande email para contato@senec.com.br'
  end
  def as_json(options={})
    super(only: [:id, :nome, :email])
  end
end
