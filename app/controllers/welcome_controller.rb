class WelcomeController < ApplicationController
  def index
    redirect_to recipes_path
  end

  def about
  end
end
