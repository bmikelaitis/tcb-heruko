class Query < ActiveRecord::Base 
    
def self.search(search)
  where("created_at LIKE ? OR updated_at LIKE ?", "%#{search}%", "%#{search}%") 
end

def self.beginyear(beginyear)
  where("created_at LIKE ? OR updated_at LIKE ?", "%#{search}%", "%#{search}%") 
end
    
    
end