class Volunteer < ActiveRecord::Base 
    has_many :managementinfos
    has_and_belongs_to_many :organizations, through: :managementinfo
    #before_save { self.emailSignIn = emailSignIn.downcase }
    validates :firstName, presence: true, length: { minimum: 2, maximum: 15 }
    validates :lastName, presence: true, length: { minimum: 2, maximum: 20 }
    VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :emailSignIn, presence: true, length: { maximum: 105 },
                                        uniqueness: { case_sensitive: false },
                                        format: { with: VALID_EMAIL_REGEX }
    validates :phone, presence: true
    validates :title, presence: true
    
    has_secure_password

def self.search(search)
  where("firstName LIKE ? OR lastName LIKE ?", "%#{search}%", "%#{search}%") 
end
    
    
end



