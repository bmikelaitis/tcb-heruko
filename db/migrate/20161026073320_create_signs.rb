class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.integer :ceremony_id
      t.string :milesNeeded
      t.string :signPlacement
      t.string :signLocation
      t.timestamps
    end
  end
end
