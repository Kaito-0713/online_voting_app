# app/controllers/elections_controller.rb
class ElectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_election, only: [:show]

  def index
    @elections = Election.all
  end

  def show
    @candidates = @election.candidates
  end

  private

  def set_election
    @election = Election.find(params[:id])
  end
end
