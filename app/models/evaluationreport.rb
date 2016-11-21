class Evaluationreport < ActiveRecord::Base 
    belongs_to :organization
    belongs_to :volunteer , :foreign_key => "id"
    
    
def self.search(search)
  where("cleanUpsDone LIKE ? OR cleanUpsRequired LIKE ? OR date LIKE ? OR evalPeriodStart LIKE ? OR evalPeriodEnd LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end

end
    