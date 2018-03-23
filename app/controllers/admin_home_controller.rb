class AdminHomeController < ApplicationController
	before_action :authenticate_admin!

  def index
    @testimonials = Testimonial.where(show: true)

  end

end