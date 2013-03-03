require 'digest/sha1'

class UsersController < ApplicationController
  respond_to :json

#Sending out an email should only take a fraction of a second, but if you are planning on sending out many emails, or you have a slow domain resolution service, you might want to investigate using a background process like Delayed Job.

	# Creates a new user and a token for the given user[email] and user[residence].
	# Sends an email to the user with the created token to verify her.
  # The url to verify the user callbacks to #verify with the token.
  def create
		@email = params[:email]

    @token = Digest::SHA1.hexdigest @email + params[:residence]
		@user = User.find_or_create_by_email(@email)
    @residence = Residence.create(:residence => BCrypt::Password.create(params[:residence]), :token => @token)
    @residence.user = @user
    @residence.save
 
		EmailVerificationMailer.verify(@user, @residence).deliver

    respond_with(@user)
  end

  def index
		@email = params[:email]
    @token = Digest::SHA1.hexdigest @email + params[:residence]
    @residence = Residence.find_by_token(@token)
    if(!@residence)
			respond_to do |format|
      	format.json { render :json => [], :status => :not_found }
    	end
		return false
    end

		if(BCrypt::Password.new(@residence.residence) == params[:residence] && !@residence.isAuthorised?)
			respond_to do |format|
      	format.json { render :json => [], :status => :unauthorized }
    	end
		return false
		end

		respond_with(@residence)
  end

  # Verifies the residence against the given token.
  # If the residence exists, it is authorised.
	# If not, a 403 is returned
  def verify
		begin
		@residence = Residence.find_by_token(params[:token])
		rescue ActiveRecord::RecordNotFound
			respond_to do |format|
      	format.json { render :json => [], :status => :forbidden }
      end
		return false
		end

		@residence.isAuthorised = true
		@residence.save
    @user = @residence.user

		EmailVerificationMailer.welcome(@user).deliver

	respond_to do |format|
		format.html
	end
  end

end
