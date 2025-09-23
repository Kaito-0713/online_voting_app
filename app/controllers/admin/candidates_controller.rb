module Admin
  class CandidatesController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin
    before_action :set_election
    before_action :set_candidate, only: [:show, :edit, :update, :destroy, :remove_image]

    def index
      @candidates = @election.candidates
    end

    def new
      @candidate = @election.candidates.new
    end

    def create
      @candidate = @election.candidates.new(candidate_params)
      if @candidate.save
        @candidate.generate_public_image if @candidate.image.attached?

        redirect_to admin_election_candidates_path(@election), notice: "候補者を登録しました"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update

  # 既存の画像を削除してから新しい画像を添付
      if params[:candidate][:image].present?
        @candidate.image.purge # 古い画像を削除
        @candidate.image.attach(params[:candidate][:image]) # 新しい画像を添付
      end

      if @candidate.update(candidate_params)
        @candidate.generate_public_image if @candidate.image.attached?
        
        redirect_to admin_election_candidates_path(@candidate.election), notice: "候補者情報を更新しました"
      else
        render :edit
      end
    end

    def destroy
      @candidate.destroy
      redirect_to admin_election_candidates_path(@election), notice: "候補者を削除しました"
    end

    def remove_image
      @candidate.image.purge
      redirect_to edit_admin_election_candidate_path(@candidate.election, @candidate), notice: "画像を削除しました"
    end

    private

    def set_election
      @election = Election.find(params[:election_id])
    end

    def set_candidate
      @candidate = @election.candidates.find(params[:id])
    end

    def candidate_params
      params.require(:candidate).permit(:name, :party, :policy, :image)
    end

    def require_admin
      redirect_to root_path, alert: "管理者以外はアクセスできません" unless current_user.admin?
    end
  end
end
