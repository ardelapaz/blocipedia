class UsersController < ApplicationController
    def demote
        current_user.member!
        current_user.paid = false
        current_user.wikis.each do |wiki|
            wiki.is_private = false
            wiki.save!
        end
        flash[:notice] = "Account downgraded successfully. We hope to see you back again soon!"
        redirect_to wikis_url  
      end
end
