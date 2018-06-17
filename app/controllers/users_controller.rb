class UsersController < ApplicationController
    def demote
        current_user.member!
        current_user.paid = false
        flash[:notice] = "Account downgraded successfully. We hope to see you back again soon!"
        redirect_to wikis_url  
      end
end
