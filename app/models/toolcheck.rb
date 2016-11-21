class Toolcheck < ActiveRecord::Base 
belongs_to :organization
belongs_to :tool
    
def self.search(search)
  where("approved LIKE ? OR Status LIKE ? OR dateCheckedOut LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
end
    
end
