class Project < ActiveRecord::Base 
    belongs_to :organization
    has_one :site , :foreign_key => "id"
    has_many :ceremonies
    has_many :reports
    
def self.search(search)
  where("projectName LIKE ? OR projectLocation LIKE ? OR yearlyParticipants LIKE ? OR ifCanceled LIKE ? OR startDate LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end
    
    
end
