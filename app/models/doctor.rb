class Doctor < ActiveRecord::Base
    
    has_many :appointments
    has_many :patients, through: :appointments

    def self.search(search)
      where("name LIKE ?", "%#{search}%") 
    end
    
end
