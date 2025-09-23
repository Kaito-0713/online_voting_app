class CandidatesController < ApplicationController
  before_action :set_election

  def index
    @candidates = @election.candidates
  end

  def search
    @candidates = @election.candidates
    if params[:keyword].present?
      @candidates = @candidates.where(
        "name LIKE :kw OR policy LIKE :kw OR party LIKE :kw",
        kw: "%#{params[:keyword]}%"
      )
    end
    render :index
  end

def show
  @election = Election.find(params[:election_id])
  @candidate = @election.candidates.find(params[:id])
end


  private

  def set_election
    @election = Election.find(params[:election_id])
  end
end

