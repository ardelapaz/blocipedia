class WikiPolicy < ApplicationPolicy
    class Scope
    attr_reader :wiki, :user, :scope

    def initialize(user, scope)
        @user = user
        puts @user
        @scope = scope
    end

    def create?
        true
      end

    def resolve
        wikis = []
        if @user.role == 'admin'
          wikis = scope.all #  the user is an admin, show them all the wikis
        elsif @user.role == 'premium'
          all_wikis = scope.all
          all_wikis.each do |wiki|
            if !wiki.is_private? || wiki.user == @user || wiki.collaborators.include?(@user.id)
              wikis << wiki #  the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
            end
          end
        else # this is the lowly standard user
          all_wikis = scope.all
          wikis = []
          all_wikis.each do |wiki|
            if !wiki.is_private? || wiki.users.include?(@user)
              wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
            end
          end
        end
        wikis # return the wikis array we've built up
      end
    end
end