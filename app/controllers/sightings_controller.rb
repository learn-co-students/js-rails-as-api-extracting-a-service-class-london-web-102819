class SightingsController < ApplicationController
    #👇 not DRY, and difficult to read, write and to update, prone to errors:
=begin
    def show
        @sighting = Sighting.find(params[:id])
        render json: @sighting.to_json(:include => {
            :bird => {:only =>[:name, :species]}, 
            :location => {:only =>[:latitude, :longitude]}
        }, 
            :except => [:updated_at])
    end
    #the same 'messy' command can be implemented in an index action:

    def index
        sightings = Sighting.all
        render json: sightings.to_json(:include => {
            :bird => {:only =>[:name, :species]}, 
            :location => {:only =>[:latitude, :longitude]}
        }, 
            :except => [:updated_at])
    end 
=end 

=begin 
 to fix and improve this: create a service class 
 that's specific to our domain that handles some of the business logic of the application. 

 In this case, we are looking to handle the logic of arranging our JSON data the way we want it. 
 
 To create a class we will be able to utilize in place of the current render statements, 
    first _ create a new folder within 'app'_ [in terminal] mkdir app/services 
    next _ [terminal] touch app/services/sighting_serializer.rb
    next _ [sighting_serializer.rb] configure: set up a SightingSerializer class
=end

    def index
        sightings = Sighting.all
        render json: SightingSerializer.new(sightings).to_serialized_json
    end
 
    def show
        sighting = Sighting.find_by(id: params[:id])
        render json: SightingSerializer.new(sighting).to_serialized_json
    end

end
