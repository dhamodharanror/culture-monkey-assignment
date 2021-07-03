class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name
      t.index(:name, unique: true)

      t.timestamps
    end
  end
end
