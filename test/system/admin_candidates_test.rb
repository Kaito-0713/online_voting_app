require "application_system_test_case"

class AdminCandidatesTest < ApplicationSystemTestCase
  test "管理者候補者一覧から選挙一覧に戻る" do
    visit admin_election_candidates_path(Election.first)
    
    click_on "選挙一覧に戻る" # ここはリンクのラベルに合わせる
    
    assert_current_path admin_elections_path
    assert_text "選挙一覧" # ページに表示される見出しなど
  end
end
