class CreateEvaluationreports < ActiveRecord::Migration
  def change
    create_table :evaluationreports do |t|
      t.integer :admin_id, :organization_id
      t.integer :cleanUpsDone, :cleanUpsRequired
      t.datetime :date, :evalPeriodStart, :evalPeriodEnd
      t.timestamps
    end
  end
end
