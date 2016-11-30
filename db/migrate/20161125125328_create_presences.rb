class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.references :participant, index: true, foreign_key: true, null: false
      t.references :activity, index: true, foreign_key: true, null: false
      t.boolean :esta_ativo, default: true, null: false
      t.timestamps null: false
    end
  end
end
