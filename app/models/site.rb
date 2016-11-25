class Site < ActiveRecord::Base 
    has_one :park
    has_one :street
    has_one :wash
    has_many :projects 

def self.search(search)
  where("siteStreet LIKE ? OR siteCrossStreets LIKE ? OR siteCounty LIKE ? OR siteZip LIKE ? OR cityWardNumber LIKE ? OR countyDistrict LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end
    
    
end