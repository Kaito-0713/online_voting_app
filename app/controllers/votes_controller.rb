class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_election
  before_action :ensure_voting_open, only: [:new, :create]
  before_action :ensure_not_voted, only: [:new, :create]

  def new
    @election = Election.find(params[:election_id])
    @candidates = @election.candidates
    @vote = current_user.votes.new
  end


  def create
    @election = Election.find(params[:election_id])
    candidate = @election.candidates.find(params[:candidate_id])

    if current_user.voted_for?(@election)
      redirect_to election_path(@election), alert: "この選挙にはすでに投票済みです。"
    else
      @vote = current_user.votes.new(candidate: candidate, election_id: @election.id)
      if @vote.save
        # ✅ 投票完了ページへリダイレクト
        redirect_to election_vote_path(@election, @vote), notice: "投票が完了しました！"
      else
        render :new, alert: "投票できませんでした"
      end
    end
  end

  def show
    @vote = @election.votes.find(params[:id])
    @candidate = @vote.candidate
  end

  private

  def set_election
    @election = Election.find(params[:election_id])
  end

  def ensure_not_voted
    if current_user.voted_for?(@election)
      redirect_to election_path(@election), alert: "既に投票済みです。"
    end
  end
  
  def ensure_voting_open
    unless @election.start_at.present? && @election.end_at.present? &&
           @election.start_at <= Time.current && Time.current <= @election.end_at
      redirect_to elections_path, alert: "現在は投票期間外です。"
    end
  end
end
