class CreateCeremonies < ActiveRecord::Migration
  def change
    create_table :ceremonies do |t|
      t.string :ceremonyName
      t.string :locationPreference
      t.boolean :agreementSigned, default: false
      t.datetime :date
      t.timestamps
      
    end
  end
end
