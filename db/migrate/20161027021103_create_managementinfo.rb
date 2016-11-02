class CreateManagementinfo < ActiveRecord::Migration
  def change
    create_table :managementinfos do |t|
      t.references :volunteer, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true
      t.string :coordinatorInfo, :coordinatorTitle
      t.datetime :coordinatorStart, :coordinatorEnd
      t.timestamps
    end
  end
end
