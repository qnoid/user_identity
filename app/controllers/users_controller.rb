#
#  users_controller.rb 
#  user_identity 
#
#  Copyright (c) 2013 Markos Charatzas (@qnoid). 
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy of
#  this software and associated documentation files (the "Software"), to deal in
#  the Software without restriction, including without limitation the rights to
#  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
#  of the Software, and to permit persons to whom the Software is furnished to do
#  so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in all
#  copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#  SOFTWARE.
#
require 'digest/sha1'

class UsersController < ApplicationController
  respond_to :json

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
