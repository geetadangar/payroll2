class CreatePayroll1s < ActiveRecord::Migration[6.0]
  def change
    create_table :payroll1s do |t|

      t.timestamps
    end
  end
end
