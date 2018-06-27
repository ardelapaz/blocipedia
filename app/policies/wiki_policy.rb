class WikiPolicy < ApplicationPolicy
    attr_reader :wiki

    def initialize(user, wiki)
        super(user, wiki)
        @wiki = record
    end

    def update? 
        user.admin? || user.premium
    end

    def resolve
        wikis = []
        if user.role == 'admin'
          wikis = scope.all #  the user is an admin, show them all the wikis
        elsif user.role == 'premium'
          all_wikis = scope.all
          all_wikis.each do |wiki|
            if wiki.public? || wiki.owner == user || wiki.collaborators.include?(user)
              wikis << wiki #  the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
            end
          end
        else # this is the lowly standard user
          all_wikis = scope.all
          wikis = []
          all_wikis.each do |wiki|
            if wiki.public? || wiki.collaborators.include?(user)
              wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
            end
          end
        end
        wikis # return the wikis array we've built up
      end
end