class CollaboratorsController < ApplicationController
    def new
        @collaborator = Collaborator.new
    end

    def create
        @collaborator_user = User.find_by_email(params[:collaborator])
        @wiki = Wiki.find(params[:wiki_id])

        @collaborator = Collaborator.new(user_id: @collaborator_user.id, wiki_id: @wiki.id)

        if @collaborator.save
            flash[:notice] = "User with that email has become a collaborator!"
            redirect_to @wiki
        else
            flash.now[:alert] = "There was an error creating the collaborator. Check the email's spelling for errors!"
            redirect_to @wiki
        end
    end

    def destroy
        @wiki = Wiki.find(params[:wiki_id])
        @collaborator = Collaborator.find(params[:id])
        @collaborator_user = User.find(@collaborator.user_id)

        if @collaborator.destroy
            flash[:notice] = "User was removed as a collaborator."
            redirect_to @wiki
        else
            flash.now[:alert] = "There was an error removing the collaborator. Please try again!"
            redirect_to @wiki
        end
    end
end
