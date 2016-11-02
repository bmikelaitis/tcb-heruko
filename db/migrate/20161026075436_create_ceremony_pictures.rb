class CreateCeremonyPictures < ActiveRecord::Migration
  def change
    create_table :ceremony_pictures do |t|
      t.integer :ceremonies_id
      t.attachment :file
      t.timestamps
    end
  end
end
