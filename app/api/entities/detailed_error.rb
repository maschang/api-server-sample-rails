module Entities
  class DetailedError < Error
    expose :backtrace,
           documentation: { type: 'string', desc: 'Error backtrace', is_array: true }
  end
end
