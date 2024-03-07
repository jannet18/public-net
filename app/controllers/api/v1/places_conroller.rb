module Api 
    module  V1  
        class PlacesController < ApplicationController
            # get a list of all places
            def index
                place = Place.all
                render json: meal, status: 200
            end
        end
    end
end