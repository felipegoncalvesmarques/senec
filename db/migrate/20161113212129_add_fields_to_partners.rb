# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-13 19:11:14
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-13 19:11:86

class AddFieldsToPartners < ActiveRecord::Migration
  def change
    change_table :partners do |t|
      t.string :nome, :telefone
    end
  end
end
