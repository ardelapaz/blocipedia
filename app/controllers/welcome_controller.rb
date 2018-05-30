class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to wikis_url
    end
  end

  def about
  end
end
