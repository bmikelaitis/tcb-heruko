class CreateCeremonyNotes < ActiveRecord::Migration
  def change
    create_table :ceremony_notes do |t|
      t.integer :ceremonies_id, :volunteer_id
      t.string :ceremonyNotes
      t.timestamps
    end
  end
end
