class CreateVolunteeremails < ActiveRecord::Migration
  def change
    create_table :volunteeremails do |t|
      t.integer :volunteer_id
      t.string :email
      t.timestamps
    end
  end
end
