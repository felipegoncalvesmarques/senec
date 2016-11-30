# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-13 17:11:07
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-13 17:11:72

class AddUpdatedByToCompany < ActiveRecord::Migration
  def change
    change_table :companies do |t|
      t.references :atualizado_por, references: :organizers
    end
    add_foreign_key :companies, :organizers, column: :atualizado_por_id
  end
end
