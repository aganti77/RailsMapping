class LocationController < ApplicationController
    
@@tempMapData = []
@@noRepeat = []

  def map
    @addresses = []
    @permitIDs = []
    @typeCodes = []
    @typeNames= []
    @appDess = []
    @dateIssueds = []
    @statuses = []
    @conNames = []
    @conAddr1s = []
    @cities = []
    @states = []
    @zips = []
    @lats = []
    @longs = []
    @locations = Location.all
    @locations.each do |location|
      @addresses << location.address
      @permitIDs << location.permitID
      @typeCodes << location.typeCode
      @typeNames << location.typeName
      @appDess << location.appDes
      @dateIssueds << location.dateIssued
      @statuses << location.status
      @conNames << location.conName
      @conAddr1s << location.conAddr1
      @cities << location.city
      @states << location.state
      @zips << location.zip
      coordinates = Geocoder.coordinates(location.address)
      @lats << coordinates[0]
      @longs << coordinates[1]
    end
    gon.address = @addresses
    gon.permitID = @permitIDs
    gon.typeCode = @typeCodes
    gon.typeName = @typeNames
    gon.appDes = @appDess
    gon.dateIssued = @dateIssueds
    gon.status = @statuses
    gon.conName = @conNames
    gon.conAddr1 = @conAddr1s
    gon.city = @cities
    gon.state = @states
    gon.zip = @zips
    gon.lat = @lats
    gon.long = @longs
    gon.tempMapData = @@tempMapData
  end

  def add_location
  end

  def new_location
    newPointData = []
    permitID = params[:permitID]
    if !(@@noRepeat.include?(permitID))
      address = params[:address]
      newPointData << address
      newPointData << permitID
      @@noRepeat << permitID
      newPointData << params[:typeCode]
      newPointData << params[:typeName]
      newPointData << params[:appDes]
      newPointData << params[:dateIssued]
      newPointData << params[:status]
      newPointData << params[:conName]
      newPointData << params[:conAddr1]
      newPointData << params[:city]
      newPointData << params[:state]
      newPointData << params[:zip]
      coordinates = Geocoder.coordinates(address)
      newPointData << coordinates[0]
      newPointData << coordinates[1]
      @@tempMapData << newPointData
    end
    render :nothing => true
  end
end
