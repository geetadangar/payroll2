class CreatePayrollImports < ActiveRecord::Migration[6.0]
  def change
    create_table :payroll_imports do |t|

      t.timestamps
    end
  end
end
