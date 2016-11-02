class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :subtype
      t.string :siteStreet, :siteCrossStreets, :siteCounty, :siteZip
      t.string :status
      t.string :cityWardNumber, :countyDistrict
      t.boolean :permitRequired, :permitInPlace
      t.timestamps
    end
  end
end
