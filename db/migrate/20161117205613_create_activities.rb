# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-17 18:11:25
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-17 19:11:13

class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :titulo, :descricao, :local
      t.integer :numero_de_vagas
      t.references :criado_por, references: :organizers
      t.references :atualizado_por, references: :organizers
      t.datetime :data_horario, :data_limite_de_inscricao
      t.boolean :esta_ativo
      t.timestamps null: false
    end
    add_foreign_key :activities, :organizers, column: :criado_por_id
    add_foreign_key :activities, :organizers, column: :atualizado_por_id
    change_column_default(:activities, :esta_ativo, true)
    change_column_null(:activities, :titulo, false)
    change_column_null(:activities, :descricao, false)
    change_column_null(:activities, :local, false)
    change_column_null(:activities, :esta_ativo, false)
    change_column_null(:activities, :criado_por_id, false)
    change_column_null(:activities, :numero_de_vagas, false)
    change_column_null(:activities, :data_horario, false)
    change_column_null(:activities, :data_limite_de_inscricao, false)
  end
end
