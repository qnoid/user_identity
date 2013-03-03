require 'spec_helper'

describe ItemsController do
  it "should show item" do
		@item = FactoryGirl.create(:item)
    get( :show, { :id => @item.id} )
		response.should be_success
  end

  it "should update location name" do
		@item = FactoryGirl.create(:item)
    put( :update, :id => @item.id, :item => { :location_attributes => { :name => 'foo'} }, :format => "json" )
    assert_response :created
  end 

end
