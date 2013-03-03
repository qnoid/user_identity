require 'spec_helper'

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
