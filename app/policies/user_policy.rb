class UserPolicy < ApplicationPolicy

    def initialize(user, wiki)
        super(user, wiki)
        @wiki = record
    end
end