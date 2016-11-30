# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-13 14:11:56
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-13 14:11:67

class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :nome
      t.references :criado_por, references: :organizers
      t.timestamps null: false
    end
    add_foreign_key :companies, :organizers, column: :criado_por_id
  end
end
