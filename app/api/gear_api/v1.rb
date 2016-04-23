module GearApi
  class V1 < Grape::API
    version 'v1', using: :path, vendor: 'gear_api'
    content_type :json, 'application/json; charset=UTF-8'
    prefix :api
    format :json
  end
end  
