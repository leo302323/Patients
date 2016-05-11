class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :code, limit: 10
      t.string :name, limit: 80

      t.timestamps null: false
    end
  end
end
