class Shorttermevent < ActiveRecord::Base 
    belongs_to :organization
    has_one :site , :foreign_key => "id"
    
    
def self.search(search)
  where("type LIKE ? OR timeFrame LIKE ? OR startDate LIKE ? OR endDate LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end

end
    