class Ability
  include CanCan::Ability

  def initialize(user)
    if user.teacher?
      can :manage, Profile, :teacher_id => user.id
      can :manage, Qualifyingentity, :profile_id => user.current_profile.try(:id)
      can :manage, ClassroomDiary, :profile_id => user.current_profile.try(:id)
      can :manage, Classroom, Classroom.where(:profile_id => user.profiles.map(&:id)) do |object|
        user.profiles.map(&:id).include?(object.profile_id)
      end
      can :create, Classroom if !user.profiles.empty?
      # can :manage, Student, Student.joins(:classrooms).where('profile_id in (?)', user.profiles) do |object|
      #   object.classrooms.map(&:profile_id).all?{|p| user.profile_ids.include?(p)}
      # end
      
      can :manage, Student, :teacher_id => user.id

      # can :manage, Student, Student.all.each do |object|
      #   object.classrooms.include?(user.classrooms.map(&:id))
      # end
      # can :manage, Student, Student.where(:classrooms => user.classrooms.map(&:id)) do |object|
      #   user.classrooms.map(&:id).include?(object.classroom_id)
      # end
      can :manage, Point, :profile_id => user.current_profile.try(:id)
      can :manage, Absence, :profile_id => user.current_profile.try(:id)
      can :manage, Observation, :profile_id => user.current_profile.try(:id)
      can :manage, Incident, :profile_id => user.current_profile.try(:id)
    end
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
