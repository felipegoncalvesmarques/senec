# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-14 20:11:93
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-14 20:11:41

class AddCompanyId < ActiveRecord::Migration
  def change
    change_table :partners do |t|
      t.belongs_to :company
    end
    add_foreign_key :partners, :companies, column: :company_id
  end
end
