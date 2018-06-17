class UsersController < ApplicationController
    def demote(@user)
        @user.update(
          [1,2],
          [
            {paid: false},
            {role: "member"}
          ]
        )
        flash[:notice] = "Account downgraded successfully. We hope to see you back again soon!"
        redirect_to wikis_url  
      end
end
