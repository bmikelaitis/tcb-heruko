class CreateCeremonynotes < ActiveRecord::Migration
  def change
    create_table :ceremonynotes do |t|
      t.integer :ceremony_id, :volunteer_id
      t.string :ceremonyNotes
      t.timestamps
    end
  end
end
