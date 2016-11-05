class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :project_id
      t.string :workDone
      t.integer :numVolunteers, :totalHours
      t.datetime :dateLastWork
      t.timestamps
    end
  end
end
