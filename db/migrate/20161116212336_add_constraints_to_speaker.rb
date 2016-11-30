# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-16 19:11:17
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-16 19:11:04

class AddConstraintsToSpeaker < ActiveRecord::Migration
  def change
    change_column_default(:speakers, :esta_ativo, true)
    change_column_null(:speakers, :nome, false)
    change_column_null(:speakers, :descricao, false)
    change_column_null(:speakers, :telefone, false)
    change_column_null(:speakers, :esta_ativo, false)
    change_column_null(:speakers, :criado_por_id, false)
    change_column_null(:speakers, :company_id, false)
  end
end
