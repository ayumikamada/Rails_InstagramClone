module UsersHelper
    def set_user?(user)
        current_user.id == user.id
      end
end
