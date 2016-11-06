require 'gibbon'

class SessionsController < Devise::SessionsController
  before_action :mailchimp_authentication

  def new
    super
  end

  def mailchimp_authentication
    if user_signed_in?

      # API key in initializers/gibbon.rb
      gibbon = Gibbon::Request.new 

      list_id = '37c0671091'
      current_loggedin_email = current_user.email
      hashed_email = Digest::MD5.hexdigest(current_loggedin_email)


      begin
        member = gibbon.lists(list_id).members(hashed_email.downcase).retrieve
        puts member['status']
        if member['status'] == 'subscribed'
          # take them to the MVG
        else
          #resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
          redirect_to logout_path

        end

      rescue Gibbon::MailChimpError => e
        redirect_to logout_path
      end

    end
  end

end