class Project < ActiveRecord::Base 
    belongs_to :organization
    belongs_to :site, :foreign_key => "site_id"
    has_many :ceremonies
    has_many :reports
    
def self.search(search)
  where("projectName LIKE ? OR projectLocation LIKE ? OR yearlyParticipants LIKE ? OR ifCanceled LIKE ? OR startDate LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end
    
    
end
