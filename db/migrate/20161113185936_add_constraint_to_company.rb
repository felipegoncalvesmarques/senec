# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-13 16:11:05
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-13 17:11:59

class AddConstraintToCompany < ActiveRecord::Migration
  def change
    change_column_default(:companies, :esta_ativo, true)
    change_column_null(:companies, :nome, false)
    change_column_null(:companies, :descricao, false)
    change_column_null(:companies, :endereco, false)
    change_column_null(:companies, :telefone, false)
    change_column_null(:companies, :logo, false)
    change_column_null(:companies, :esta_ativo, false)
    change_column_null(:companies, :criado_por_id, false)
  end
end
