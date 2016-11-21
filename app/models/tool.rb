class Tool < ActiveRecord::Base 
    has_many :toolchecks
def self.search(search)
  where("toolName LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%") 
end
    
    
end