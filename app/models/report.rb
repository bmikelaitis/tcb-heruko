class Report < ActiveRecord::Base 
    belongs_to :project
    
def self.search(search)
  where("numVolunteers LIKE ? OR totalHours LIKE ? OR dateLastWork LIKE ? OR workDone LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end

end
    