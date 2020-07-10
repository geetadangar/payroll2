class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :cin
      t.string :phone
      t.string :website
      t.string :Email_id

      t.timestamps
    end
  end
end
