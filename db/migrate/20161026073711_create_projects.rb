class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :organization_id, :site_id
      t.string :projectName
      t.string :projectLocation
      t.string :yearlyParticipants
      t.boolean :ifCanceled, default: false
      t.datetime :startDate 
      t.timestamps
    end
  end
end
