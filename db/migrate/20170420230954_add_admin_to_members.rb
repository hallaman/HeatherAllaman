class AddAdminToMembers < ActiveRecord::Migration
  def change
  	unless column_exists? :members, :admin
		  add_column :members, :admin, :boolean
		end
		unless column_exists? :members, :superuser
		  add_column :members, :superuser, :boolean
		end
		unless column_exists? :members, :username
		  add_column :members, :username, :string
		end
  end
end

