class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to wikis_show_url
    end
  end

  def about
  end
end
