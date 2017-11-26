module Entities
  class Item < Base
    expose :name, documentation: { type: 'string', desc: '名称'}
  end
end
