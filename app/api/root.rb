class Root < Grape::API
  prefix :api

  DETAILED_ERROR = %w(test development).include?(Rails.env)
  ERROR_ENTITY = DETAILED_ERROR ? Entities::DetailedError : Entities::Error
  AUTH_ERROR_CODES = [
    { code: 401, message: 'Unauthorized', model: ERROR_ENTITY },
    { code: 403, message: 'Forbidden', model: ERROR_ENTITY }
  ].freeze
  COMMON_ERROR_CODES = [
    { code: 400, message: 'Bad Request', model: Entities::ValidationError },
    { code: 500, message: 'Internal Server Error', model: ERROR_ENTITY }
  ].freeze
  ERROR_CODES = [*AUTH_ERROR_CODES, *COMMON_ERROR_CODES].freeze

  # Error Handling
  # 500
  error_formatter :json, lambda { |message, backtrace, _options, _env, _original_exception|
    if Root::DETAILED_ERROR
      { message: message.to_s, backtrace: backtrace[0, 200] }.to_json
    else
      { message: 'Unexpected Error' }.to_json
    end
  }

  default_error_formatter :json
  rescue_from :all
  # others
  rescue_from Grape::Exceptions::ValidationErrors do |e|
    errors = []
    e.errors.each_pair { |attribute, messages| errors << { field: attribute.first, messages: messages } }
    rack_response("{ \"message\": \"Validation Failed\", \"errors\": #{errors.to_json} }", 400)
  end
  rescue_from ActiveRecord::RecordNotFound do |_e|
    rack_response('{ "message": "Not Found." }', 404)
  end

  mount V1

  # Treat ActionController::RoutingError as 404
  # For all unmatched routes except '/'
  route :any, '*path' do
    error!({ error: "No such route '#{request.path}'" }, 404)
  end
  # For '/'
  route :any do
    error!({ error: "No such route '#{request.path}'" }, 404)
  end
end
