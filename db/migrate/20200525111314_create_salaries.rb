class CreateSalaries < ActiveRecord::Migration[6.0]
  def change
    create_table :salaries do |t|
      t.string :salary_details

      t.timestamps
    end
  end
end
