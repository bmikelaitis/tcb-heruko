class CreateProjectvolunteers < ActiveRecord::Migration
  def change
    create_table :projectvolunteers do |t|
       t.integer :volunteer_id, :project_id
    end
  end
end
