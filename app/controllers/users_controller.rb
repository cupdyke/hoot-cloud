class UsersController < ApplicationController
	has_secure_password
	before_save :create_avatar_url
	before_validation :prep_email
	validates :name, presence: true
	validates :username, uniqueness: true, presence: true
	validates :email, uniqueness: true, presence: true, format: { with: /^[\w.+-]+@([\w]+.)+\w+$/ }

	def new
	end

	def create
  		@user = User.new(params[:user])
 
  		if @user.save
    		redirect_to @user, notice: "Thank you for signing up for Ribbit!"
  		else
    		render 'new'
  		end
	end

	def show
  		@user = User.find(params[:id])
	end

private
 
	def prep_email
    	self.email = self.email.strip.downcase if self.email
	end

	def create_avatar_url
    	self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
	end

end