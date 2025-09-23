class ApplicationController < ActionController::Base 
  # Deviseコントローラーの場合は許可パラメータを追加
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ページごとにレイアウトを切り替え
  layout :layout_by_resource

  protected

  # サインアップ・アカウント更新時の追加パラメータ
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :identification_number, :id_document])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :identification_number, :id_document])
  end

  # ログイン後の遷移先をホームに固定
 def after_sign_in_path_for(resource)
    if resource.admin?
      admin_elections_path  # 管理者の場合は管理画面トップへ
    else
      root_path             # 有権者の場合は通常トップへ
    end
  end

  # ログアウト後はログインページに固定
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  private

  # レイアウト切り替え
  def layout_by_resource
    if devise_controller?
      "devise"       # app/views/layouts/devise.html.erb が必要
    else
      "application"  # 通常ページ
    end
  end
end
