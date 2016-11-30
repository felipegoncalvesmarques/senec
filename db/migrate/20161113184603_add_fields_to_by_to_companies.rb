# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-13 16:11:11
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-13 16:11:90

class AddFieldsToByToCompanies < ActiveRecord::Migration
  def change
    change_table :companies do |t|
      t.text :descricao
      t.string :endereco, :logo, :telefone
      t.boolean :esta_ativo
    end
  end
end
