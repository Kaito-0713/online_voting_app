class HomeController < ApplicationController
  before_action :authenticate_user!

  layout "application"

  def index
    @election = Election.order(start_at: :desc).first
  end

  def contact
  end
end
