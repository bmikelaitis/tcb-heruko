class CreateShorttermevents < ActiveRecord::Migration
  def change
    create_table :shorttermevents do |t|
      t.integer :organization_id, :site_id
      t.string :eventtype, :timeFrame
      t.datetime :startDate, :endDate
      t.timestamps
    end
  end
end
