class SightingSerializer
=begin
    1st _ define an 'initialize', to set up any instance variables that we might want to
        share over multiple methods.
        In this case, 'initialize will take in whatever variable we're dealing with in a particular action, and stor it as an instance varialbe:
            Now whatever we pass when initializing a new instance of SightingSerializer will be stored as @sighting.
    2nd _  write a method that will call to_json on this instance variable, handling the inclusion and exclusion of attributes, and return the results.
=end
    def initialize(sighting_object)
        @sighting = sighting_object
    end

    def to_serialized_json
        @sighting.to_json(:include => {
            :bird => {:only => [:name, :species]},
            :location => {:only => [:latitude, :longitude]}
          }, :except => [:updated_at, :created_at])  
=begin
    👆furthur abstraction:
    def to_serialized_json
        options ={
            include: {
                bird: {
                    only:[:name, :species]
                },
                location:{
                    only:[:latitude, :longitude]
                }
            },
            except: [:updated_at, :created_at]
        }
        @sighting.to_json(options)
    end
=end      
    end

=begin
    With this setup, once an instance of SightingSerialize is created, we can call'to_serialized_json' on it to get our data
    customized and ready to go as a JSON string.
=end
end