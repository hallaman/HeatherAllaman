require 'instagram'

class WelcomeController < ApplicationController
  def index
  	
    client = Instagram.client(:access_token => '1517317818.1677ed0.daa3778c68b149cc82e9608c931a59d6')
    @insta = client.present? ? client.user_recent_media : ''

    @testimonials = Testimonial.where(show: true)

  end
end
