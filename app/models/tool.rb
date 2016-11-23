class Tool < ActiveRecord::Base 
    has_many :toolchecks
def self.search(search)
  where("toolName LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%") 
end
    
def self.searchdate(search)
  where("created_at LIKE ? OR updated_at LIKE ?", "%#{search}%", "%#{search}%") 
end
    
    
end