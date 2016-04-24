module GearApi
  class V1::Gear < Grape::API
    use Rack::JSONP

    helpers do
      #part of tutorial not sure if i need
      #params :token do
      #  optional :token, type: String, default: nil,
      #  documentation: {
      #    type: 'String',
      #    desc: 'Authenticate token'
      #  }
      #end

      params :attributes do
        optional :attributes, type: Hash, default: {},
        documentation: {
          type: 'Hash',
          desc: 'Params attributes of gear'
        }
      end
    end

    resource :gear do
      get do
        api_response(::Gear.all.to_json)
      end

      route_param :id do
        params do
          #not sure if the token will work with no user auth
          use :token, type: String, desc: 'Authentication token'
          requires :id, type: Integer, desc: "Gear ID"
        end
        get do
          begin
            #authenticate!
            gear = ::Gear.find(params[:id])
            api_response(gear.to_json)
          rescue ActiveRecord::RecordNotFound => e
            status 404 # Not found
          end
        end
      end


      params do
        use :token #, type: String, desc: 'Authentication token'
        #requires :id, type: Integer, desc: "Gear ID"
        requires :attributes, type: Hash, desc: 'gear object to create' do
          requires :gear_type, type: String, desc: 'Name of gear'
          requires :gear_quantity, type: Integer, desc: 'Price of gear'
          requires :color, type: String, desc: 'color of gear'
          requires :wildlife, type: Boolean, desc: 'value of true means wildlife was found in gear'
          requires :wildlife_quantity, type: Integer, desc: 'number of wildlife found caught in gear'
          requires :latitude, type: Float, desc: 'latitude of gear'
          requires :longitude, type: Float, desc: 'longitude of gear'
          requires :lost, type: Integer, desc: 'value of 1 means gear is a lost item'
          requires :found, type: Integer, desc: 'value of 1 means gear is a found item'
        end
      end

      post do
        begin
          #authenticate!
          safe_params = clean_params(params[:attributes])
                        .permit(:gear_type, :gear_quantity, :color, :wildlife, :wildlife_quantity, :latitude, :longitude, :lost, :found)

          if safe_params
            ::Gear.create!(safe_params)
            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end

      end
    end


  end
end
