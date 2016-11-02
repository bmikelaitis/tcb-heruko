class Park < ActiveRecord::Base 
  belongs_to :site
validates :id, presence:true
def self.search(search)
  where("siteStreet LIKE ? OR siteCrossStreets LIKE ? OR siteCounty LIKE ? OR siteZip LIKE ? OR cityWardNumber LIKE ? OR countyDistrict LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end
    
end