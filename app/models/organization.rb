class Organization < ActiveRecord::Base 
    has_many :managementinfos
    has_many :projects
    has_many :volunteers, through: :managementinfo
    #before_save { self.emailSignIn = emailSignIn.downcase }
    validates :organizationName, presence: true, length: { minimum: 2, maximum: 50 }
    validates :organizationStreet, presence: true
    validates :organizationCity, presence: true
    validates :organizationZip, presence: true
    validates :organizationState, presence: true
    validates :organizationPhone, presence: true


def self.search(search)
  where("organizationName LIKE ?", "%#{search}%") 
end
    
    
end

