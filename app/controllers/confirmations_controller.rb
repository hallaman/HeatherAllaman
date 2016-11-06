class ConfirmationsController < Devise::ConfirmationsController
  private
  def after_confirmation_path_for(resource_name, resource)
    new_user_confirmation_path
  end
end