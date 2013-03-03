module Foo

	def foo(params)
	# no foursquare location was selected
	if(params[:item][:location_attributes][:foursquareid].nil?) 
		@item = Item.create( params[:item] )
	return @item
	end

	# new foursquare location
  @locations = Location.all(:conditions => {:foursquareid => params[:item][:location_attributes][:foursquareid]})
	if(@locations.empty?)
		@item = Item.create( params[:item] )
	return @item
	end

  # existing foursqaure location
	@location = @locations.first 
  params[:item].delete(:location_attributes)
  @item = @location.items.create( params[:item] )
  return @item
	end

end
