class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :registerable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :teacher_code, :name, :surname, :classroom_ids, :department_ids
  has_and_belongs_to_many :departments
  has_many :classrooms, :through => :profiles
  has_many :profiles, :order =>  'id ASC'

  # Devuleve el perfil actual con el que trabaja el usuario
  def current_profile
    profile = profiles.detect {|a| a.default == true}
    unless profile
      profile = profiles.first
      profile.update_attribute(:default, true) if profile
    end
    profile
  end

  # Cambia le perfil actual de la aplicación
  def change_current_profile(new_profile)
    # FIXME es un poco dar vueltas porque current_profile
    # ya pone el primero a current si no hay ninguno.
    current_profile.update_attribute(:default, false)
    new_profile.update_attribute(:default, true)
  end

  def full_name
    "#{self.name} #{self.surname}"
  end

  def teacher?
    true
  end
end
