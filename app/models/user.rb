class User < ActiveRecord::Base
	attr_accessible :avatar_url, :email, :name, :password, :password_confirmation, :username
end