class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(member)
    '/logout'
  end
end 