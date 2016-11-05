class CreateSitenotes < ActiveRecord::Migration
  def change
    create_table :sitenotes do |t|
      t.integer :site_id, :volunteer_id
      t.string :siteNotes
      t.timestamps
    end
  end
end
