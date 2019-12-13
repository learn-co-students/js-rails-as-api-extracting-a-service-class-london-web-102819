class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        render json: SightingSerilaizer.new(sightings).to_serialized_json
    end

    def show
        sighting = Sighting.find(params[:id])
        render json: SightingSerilaizer.new(sighting).to_serialized_json
    end
end
