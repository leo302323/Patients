class AddLocationRefToPatients < ActiveRecord::Migration
  def change
    add_reference :patients, :location, index: true, foreign_key: true
  end
end
