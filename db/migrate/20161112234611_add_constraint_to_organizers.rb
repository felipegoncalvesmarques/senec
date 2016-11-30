# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-12 21:11:20
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-12 23:11:44

class AddConstraintToOrganizers < ActiveRecord::Migration
  def change
    change_column_default(:organizers, :esta_ativo, true)
    change_column_null(:organizers, :esta_ativo, false)
    change_column_null(:organizers, :nome, false)
    change_column_null(:organizers, :telefone, false)
  end
end
