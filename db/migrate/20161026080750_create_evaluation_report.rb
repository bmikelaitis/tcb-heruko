class CreateEvaluationReport < ActiveRecord::Migration
  def change
    create_table :evaluation_reports do |t|
      t.integer :volunteer_id, :organization_id
      t.integer :cleanUpsDone, :cleanUpsRequired
      t.datetime :date, :evalPeriodStart, :evalPeriodEnd
      t.timestamps
    end
  end
end
