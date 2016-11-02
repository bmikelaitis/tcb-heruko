class Tool < ActiveRecord::Base 
    
def self.search(search)
  where("toolName LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%") 
end
    
    
end