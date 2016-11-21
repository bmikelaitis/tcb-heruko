class CreateRegularmembers < ActiveRecord::Migration
  def change
    create_table :regularmembers do |t|
       t.integer :volunteer_id
       t.decimal :reportedHours,  precision: 6, scale: 2
    end
  end
end
