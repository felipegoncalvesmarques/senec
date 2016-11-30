# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-12 16:11:29
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-12 17:11:97

class AddConstraintToParticipant < ActiveRecord::Migration
  def change
    change_column_default(:participants, :esta_ativo, true)
    change_column_null(:participants, :esta_ativo, false)
    change_column_null(:participants, :nome, false)
    change_column_null(:participants, :telefone, false)
    change_column_null(:participants, :instituto, false)
    change_column_null(:participants, :curso, false)
    change_column_null(:participants, :ano, false)
  end
end
