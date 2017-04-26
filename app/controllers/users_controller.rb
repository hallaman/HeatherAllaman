class UsersController < ApplicationController
	def show
		@user = Member.find(params[:id])
		@teachers = Member.where('superuser = ?', true).pluck(:id)
	end
end
