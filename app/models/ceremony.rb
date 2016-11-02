class Ceremony < ActiveRecord::Base 
	has_many :ceremonyaward
def self.search(search)
  where("ceremonyName LIKE ? OR locationPreference LIKE ? OR date LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
end
    
end