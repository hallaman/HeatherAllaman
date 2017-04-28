class UsersController < ApplicationController
	def show
		@user = Member.find(params[:id])
	end
end
