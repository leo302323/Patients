class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name, limit: 30
      t.string :last_name, limit: 10
      t.string :middle_name, limit: 30
      t.date :date_of_birth
      t.string :gender
      t.string :status

      t.timestamps null: false
    end
  end
end
