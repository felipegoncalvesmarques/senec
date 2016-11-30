# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-12 20:11:70
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-12 20:11:71

class AddFieldsToOrganizer < ActiveRecord::Migration
  def change
    change_table :organizers do |t|
      t.string :nome, :telefone
      t.boolean :esta_ativo
    end
  end
end
