class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :firstName
      t.string :lastName
      t.string :emailSignIn
      t.boolean :admin, default: false
      t.string :title
      t.string :phone
      t.timestamps
    end
  end
end
