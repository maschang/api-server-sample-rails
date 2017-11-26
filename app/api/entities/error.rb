# For Swagger Documentation only
module Entities
  class Error < Grape::Entity
    expose :message, documentation: { type: 'string', desc: 'Error description' }
  end
end
