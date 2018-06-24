class Collaborator < ApplicationRecord
    def self.wikis  
        Wiki.pluck(:wiki_id)
    end

    def self.users
        User.pluck(:user_id)
    end

    def user
        User.find(user_id)
    end

    def wiki
        Wiki.find(wiki_id)
    end
end
