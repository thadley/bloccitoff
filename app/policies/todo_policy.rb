class TodoPolicy < ApplicationPolicy

    def index?
        true
    end

    def destroy?
        user.present? && (record.user == user)
    end
    
end