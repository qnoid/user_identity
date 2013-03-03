class EmailVerificationMailer < ActionMailer::Base
  default :from => "qnoid@verylargebox.com"

	def verify(user, residence)
		@user = user
    @residence = residence
		@url = "http://immense-coast-2846.herokuapp.com/users/verify"
		mail(:to => user.email, :subject => "Please verify your email")
	end

	def welcome(user)
		@user = user
		mail(:to => user.email, :subject => "Welcome to thebox!")
	end
end
