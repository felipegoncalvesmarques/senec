# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-12 11:11:11
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-12 11:11:31

class AddFieldsToParticipants < ActiveRecord::Migration
  def change
    change_table :participants do |t|
      t.string :nome, :telefone, :instituto, :curso
      t.boolean :esta_ativo
      t.integer :ano
    end
  end
end
