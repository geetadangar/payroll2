class AddFileToPayrollImports < ActiveRecord::Migration[6.0]
  def change
    add_column :payroll_imports, :file, :string
  end
end
