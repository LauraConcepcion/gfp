class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :teacher_code, :name, :surname, :classroom_ids, :department_ids
  has_and_belongs_to_many :departments
  has_many :classrooms
  has_many :profiles, :order =>  'id ASC'

  # Devuleve el perfil actual con el que trabaja el usuario
  def current_profile
    profile = profiles.detect {|a| a.default == true}
    unless profile
      profile = profiles.first
      profile.update_attribute(:default, true)
    end
    profile
  end

  # Cambia le perfil actual de la aplicación
  def change_current_profile(new_profile)
    if self.current_profile
      current_profile = self.current_profile
      current_profile.default = false
      current_profile.save!
    end
    profile = Profile.find(new_profile.id)
    profile.default = true
    profile.save!
    self.save!
  end

  def full_name
    "#{self.name} #{self.surname}"
  end

  def teacher?
    true
  end
end
