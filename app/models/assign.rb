class Assign < ActiveRecord::Base 
    
def self.search(search)
  where("siteStreet LIKE ? OR siteCrossStreets LIKE ? OR siteCounty LIKE ? OR siteZip LIKE ? OR cityWardNumber LIKE ? OR countyDistrict LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end
    
    
end