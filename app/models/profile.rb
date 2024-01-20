class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :address
  accepts_nested_attributes_for :address, allow_destroy: true

  validates_presence_of :name_profile, :profile_type, :gender
  validates :phone1, :phone2, presence: true, uniqueness: true

  
  enum gender: { masculine: "MASCULINO", feminine: "FEMININO" }
  enum profile_type: {
    estudante: "ESTUDANTE", 
    professor: "PROFESSOR", 
    funcionario: "FUNCIONARIO"
  }
  
  def self.find_by_user(user) 
    Profile.find_by(user_id: user.id)
  end
  
end
