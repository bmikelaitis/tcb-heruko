class CreateGroupcoordinators < ActiveRecord::Migration
  def change
    create_table :groupcoordinators do |t|
      t.integer :volunteer_id
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.timestamps
    end
  end
end
