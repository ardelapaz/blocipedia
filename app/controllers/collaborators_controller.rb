class CollaboratorsController < ApplicationController
    def new
        @user = User.find(params[:user_id])
        @wiki = Wiki.find(params[:wiki_id])
        @collaborator = Collaborator.new
    end

    def create
        @wiki = Wiki.find(params[:wiki_id])
        @user = Wiki.find(params[:user_id])

        if collaborator.save
            flash[:notice] = "User with that email has become a collaborator!"
            redirect_to root
        else
            flash.now[:alert] = "There was an error creating the collaborator. Check the email's spelling for errors!"
            render :new
        end
    end
end
