class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :phone
      t.float :salary, default: 0
      t.timestamps
    end
  end
end
