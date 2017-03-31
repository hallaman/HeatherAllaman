class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  def thredded_can_write_messageboards
	  if superuser?
	    Thredded::Messageboard.all
	  else
	  	# prevent Round Table (id:1) from being posted to by non-superusers (teachers)
    	Thredded::Messageboard.where.not(id: 1)
  	end
	end

	def self.thredded_messageboards_readers(messageboards)
	  # must be consistent with the #thredded_can_write_messageboards method
	  if messageboards.length == 1 && messageboards[0].id == 1
	    where(superuser: true)
	  else
	    all
	  end
	end

	def superuser 
		Member.superuser
	end

end
