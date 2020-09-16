class Ability
  include CanCan::Ability

  def initialize(user)
    # gns_core /users
    can :create, GnsCore::User if user.has_permission?('gns_core.users.create')
    
    can :read, GnsCore::User do |account|
      (user.has_permission?('gns_core.users.read_own') and account.creator == user) or
      (user.has_permission?('gns_core.users.read_other') and account.creator != user)
    end
    
    can :update, GnsCore::User do |account|
      (user.has_permission?('gns_core.users.update_own') and account.creator == user) or
      (user.has_permission?('gns_core.users.update_other') and account.creator != user)
    end
    
    can :lock, GnsCore::User do |account|
      #!account.active? and
      false and #todo: master
      (
        (user.has_permission?('gns_core.users.deactivate_own') and account.creator == user) or
        (user.has_permission?('gns_core.users.deactivate_other') and account.creator != user)
      )
    end
    
    can :unlock, GnsCore::User do |account|
      #account.active? and
      false and #todo: master
      (
        (user.has_permission?('gns_core.users.activate_own') and account.creator == user) or
        (user.has_permission?('gns_core.users.activate_other') and account.creator != user)
      )
    end
    # --------------------------
    
    # gns_core /roles
    can :create, GnsCore::Role if user.has_permission?('gns_core.roles.create')
    
    can :read, GnsCore::Role do |role|
      (user.has_permission?('gns_core.roles.read_own') and role.creator == user) or
      (user.has_permission?('gns_core.roles.read_other') and role.creator != user)
    end
    
    can :set_permissions, GnsCore::Role do |role|
      (user.has_permission?('gns_core.roles.set_permissions_own') and role.creator == user) or
      (user.has_permission?('gns_core.roles.set_permissions_other') and role.creator != user)
    end
    
    can :update, GnsCore::Role do |role|
      (user.has_permission?('gns_core.roles.update_own') and role.creator == user) or
      (user.has_permission?('gns_core.roles.update_other') and role.creator != user)
    end
    
    can :delete, GnsCore::Role do |role|
      (user.has_permission?('gns_core.roles.delete_own') and role.creator == user) or
      (user.has_permission?('gns_core.roles.delete_other') and role.creator != user)
    end
    
    can :activate, GnsCore::Role do |role|
      !role.active? and
      (
        (user.has_permission?('gns_core.roles.activate_own') and role.creator == user) or
        (user.has_permission?('gns_core.roles.activate_other') and role.creator != user)
      )
    end
    
    can :deactivate, GnsCore::Role do |role|
      role.active? and
      (
        (user.has_permission?('gns_core.roles.deactivate_own') and role.creator == user) or
        (user.has_permission?('gns_core.roles.deactivate_other') and role.creator != user)
      )
    end
    # --------------------------
  end
end
