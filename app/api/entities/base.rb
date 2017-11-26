module Entities
  class Base < Grape::Entity
    expose :id, documentation: { type: 'integer', desc: 'ID' }
    expose :updated_at, documentation: { type: 'DateTime', desc: '更新日' }
    expose :created_at, documentation: { type: 'DateTime', desc: '作成日' }
  end
end
