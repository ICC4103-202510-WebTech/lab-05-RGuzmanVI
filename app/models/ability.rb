class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can [:read, :update], User, id: user.id

    can :read, Chat, users: { id: user.id } 
    can :create, Chat 
    can [:update, :destroy], Chat, sender_id: user.id

    can :read, :all
    can :create, Message, sender_id: user.id
    can [:update, :destroy], Message, sender_id: user.id
  end
end
