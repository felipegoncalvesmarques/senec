# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-12 18:11:85
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-12 23:11:40

class Organizer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def active_for_authentication?
    # Uncomment the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml
    super && self.esta_ativo
  end

  def inactive_message
    self.esta_ativo ? super : 'Conta desativada, mande email para contato@senec.com.br'
  end
end
