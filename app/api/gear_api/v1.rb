module GearApi
  class V1 < Grape::API
    version 'v1', using: :path, vendor: 'gear_api'
    content_type :json, 'application/json; charset=UTF-8'
    prefix :api
    format :json
  end

  before do
    header['Access-Control-Allow-Origin'] = '*'
    header['Access-Control-Request-Method'] = '*'
  end

  helpers do
    def api_response response
      case response
      when Integer
        status response
      when String
        response
      when Hash
        response
      when Net::HTTPResponse
        "#{response.code}: #{response.message}"
      else
        status 400 # Bad request
      end
    end
    #not really sure I want the below authentication helper,
    #but kept it because its in the tutorial
    # def authenticate!
      # error!('Unauthorized. Invalid or expired token.', 401) unless current_user
    # end
    def clean_params(params)
      ActionController::Parameters.new(params)
    end
  end

  mount Gear
end
