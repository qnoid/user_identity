#
#  email_verification_mailer.rb 
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
class EmailVerificationMailer < ActionMailer::Base
  default :from => "qnoid@verylargebox.com"

	def verify(user, residence)
		@user = user
    @residence = residence
		@url = "http://user-identity-nsconf.herokuapp.com/users/verify"
		mail(:to => user.email, :subject => "Please verify your email")
	end

	def welcome(user)
		@user = user
		mail(:to => user.email, :subject => "Welcome!")
	end
end
