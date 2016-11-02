class Site_note < ActiveRecord::Base 
    validates :siteNotes, presence: true, length: { minimum: 5, maximum: 500 }
	belongs_to :volunteer
	belongs_to :site
end
	