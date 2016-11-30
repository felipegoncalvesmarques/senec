class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :activity, index: true, foreign_key: true, null: false
      t.references :participant, index: true, foreign_key: true, null: false
      t.boolean :esta_ativo, default: true, null: false
      t.timestamps null: false
    end
  end
end
