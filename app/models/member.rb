class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # Only superusers can post to messageboards (all other users can comment through separate view hook)
 #  def thredded_can_write_messageboards
	#   if superuser?
	#     Thredded::Messageboard.all
	#   else
	#   	# prevent all messageboards (except with id: 999999) from being posted to by non-superusers (teachers)
 #    	Thredded::Messageboard.where(id: 999999)
 #  	end
	# end

	# def self.thredded_messageboards_writers(messageboards)
	#   # must be consistent with the #thredded_can_write_messageboards method
	#   if messageboards.length == 1 && messageboards[0].id == 999999
	#     where(superuser: true)
	#   else
	#     all
	#   end
	# end

	# def superuser 
	# 	Member.superuser
	# end

end
