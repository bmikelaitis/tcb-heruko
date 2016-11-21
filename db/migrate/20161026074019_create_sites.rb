class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :subtype
      t.string :siteStreet, :siteCrossStreets, :siteCounty, :siteZip
      t.boolean :status, default: false
      t.string :cityWardNumber, :countyDistrict
      t.boolean :permitRequired, :permitInPlace
      t.timestamps
    end
  end
end
