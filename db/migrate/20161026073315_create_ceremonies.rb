class CreateCeremonies < ActiveRecord::Migration
  def change
    create_table :ceremonies do |t|
      t.integer :project_id
      t.string :ceremonyName
      t.string :locationPreference
      t.boolean :agreementSigned, default: false
      t.datetime :date
      t.timestamps
      
    end
  end
end
