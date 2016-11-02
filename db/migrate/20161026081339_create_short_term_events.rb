class CreateShortTermEvents < ActiveRecord::Migration
  def change
    create_table :short_term_events do |t|
      t.integer :organization_id, :site_id
      t.string :type, :timeFrame
      t.datetime :startDate, :endDate
      t.timestamps
    end
  end
end
