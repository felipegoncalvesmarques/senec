class CreateAcitvitySpeakers < ActiveRecord::Migration
  def change
    create_table :activity_speakers do |t|
      t.references :activity, index: true, foreign_key: true
      t.references :speaker, index: true, foreign_key: true
      t.references :criado_por, references: :organizers
      t.references :atualizado_por, references: :organizers
      t.timestamps null: false
    end
    add_foreign_key :activity_speakers, :organizers, column: :criado_por_id
    add_foreign_key :activity_speakers, :organizers, column: :atualizado_por_id
  end
end
