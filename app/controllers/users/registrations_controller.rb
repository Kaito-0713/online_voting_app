# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  layout "application", only: [:edit, :update] # edit/updateのみ application レイアウトを使用
end
