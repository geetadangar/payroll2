class RemoveCompanyIdFromEmployees < ActiveRecord::Migration[6.0]
  def change
    remove_column :employees, :company_id, :integer
  end
end
