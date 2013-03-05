#
#  users_controller_spec.rb 
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
#require 'spec_helper'

describe UsersController do
  it "should create user with residence" do
		post( :create, :email => "ask@for.it", :residence => "220dd1c0285f013097210025bce16142", :format => "json" )
    assert_response(201)
  end
  it "should return not found" do
    get( :index, :email => "a@b.c", :residence => "", :format => "json" )
    assert_response :not_found
  end
	it "should return user items" do
		@user = FactoryGirl.create(:user)
		get( :items, { :id => @user.id}, :format => "json" )
		response.should be_success
	end
end