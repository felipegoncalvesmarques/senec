# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-16 18:11:88
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-16 18:11:11

class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.references :company, index: true, foreign_key: true
      t.references :criado_por, references: :organizers
      t.references :atualizado_por, references: :organizers
      t.string :nome, :descricao, :telefone
      t.boolean :esta_ativo
      t.timestamps null: false
    end
    add_foreign_key :speakers, :organizers, column: :criado_por_id
    add_foreign_key :speakers, :organizers, column: :atualizado_por_id
  end
end
