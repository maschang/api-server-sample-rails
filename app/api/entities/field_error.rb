module Entities
  class FieldError < Grape::Entity
    expose :field, documentation: { type: 'string', desc: 'Field name' }
    expose :messages, documentation: { type: 'string', desc: 'Error detail', is_array: true }
  end
end
