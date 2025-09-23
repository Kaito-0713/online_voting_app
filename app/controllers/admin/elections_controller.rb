# app/controllers/admin/elections_controller.rb
module Admin
  class ElectionsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin!
    before_action :set_election, only: [:show, :edit, :update, :destroy, :results]

    def index
      @elections = Election.all
    end

    def show
      @election = Election.find(params[:id])
      @candidates = @election.candidates.includes(:votes)
    end

    def new
      @election = Election.new
    end

    def create
      @election = Election.new(election_params)
      if @election.save
        redirect_to admin_elections_path, notice: "選挙を作成しました"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @election.update(election_params)
        redirect_to admin_elections_path, notice: "選挙情報を更新しました"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @election.destroy
      redirect_to admin_elections_path, notice: "選挙を削除しました"
    end

    def results
      @candidates = @election.candidates.includes(:votes)
      @total_votes = @candidates.sum { |c| c.votes.count }
    end

    private

    def set_election
      @election = Election.find(params[:id])
    end

    def election_params
      params.require(:election).permit(:title, :description, :start_at, :end_at)
    end

    def authorize_admin!
      redirect_to root_path, alert: "管理者以外はアクセスできません" unless current_user&.admin?
    end
  end
end
