class AddFormonthToEmployeesalary < ActiveRecord::Migration[6.0]
  def change
    add_column :employeesalaries, :formonth, :datetime
  end
end
