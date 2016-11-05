class Ceremony < ActiveRecord::Base 
	belongs_to :project
	has_many :ceremonyawards
	has_many :ceremonynotes
	has_many :signs
def self.search(search)
  where("ceremonyName LIKE ? OR locationPreference LIKE ? OR date LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
end
    
end