require 'spec_helper'

describe LocationsController do

  it "should get locations" do
    get :index, :format => "json"
		response.should be_success
  end

end
