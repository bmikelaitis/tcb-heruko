class CreateSiteNotes < ActiveRecord::Migration
  def change
    create_table :site_notes do |t|
      t.integer :site_id, :volunteer_id
      t.string :siteNotes
      t.timestamps
    end
  end
end
