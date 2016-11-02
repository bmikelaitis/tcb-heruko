class CreateCeremonyawards < ActiveRecord::Migration
  def change
    create_table :ceremonyawards do |t|
      t.integer :ceremonies_id
      t.string :ceremonyAwardTitle
      t.string :ceremonyAwardInfo
      t.timestamps
    end
  end
end
