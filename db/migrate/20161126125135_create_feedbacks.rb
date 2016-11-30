class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :pontos_positivos, :pontos_negativos
      t.integer :nota
      t.references :participant, index: true, foreign_key: true, null: false
      t.references :activity, index: true, foreign_key: true, null: false
      t.boolean :esta_ativo, null: false, default: true
      t.timestamps null: false
    end
  end
end
