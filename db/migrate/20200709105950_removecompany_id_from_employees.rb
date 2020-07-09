class RemovecompanyIdFromEmployees < ActiveRecord::Migration[6.0]
  def change
  	remove_foreign_key :employees, :company_id,  index: true
end
end
