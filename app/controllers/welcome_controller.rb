class WelcomeController < ApplicationController
  def index
    redirect_to recipes_path
  end
end
