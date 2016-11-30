class AddEstaAtivoToPartner < ActiveRecord::Migration
  def change
  	change_table :partners do |t|
  		t.boolean :esta_ativo, null: false, default: true
  	end
  end
end
