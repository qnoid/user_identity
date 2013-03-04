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
