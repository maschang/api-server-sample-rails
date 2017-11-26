# For Swagger Documentation only
module Entities
  class ValidationError < Error
    present_collection true, :errors
    expose :errors, as: :errors, using: FieldError, documentation: { desc: 'エラーカラム情報', is_array: true }
  end
end
